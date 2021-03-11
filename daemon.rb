require_relative 'config/boot'
# require 'byebug'
# require 'net/http'
# require 'logger'
# require 'aws-sdk-sqs'

logger = Logger.new('/proc/1/fd/1')
# logger = Logger.new(STDOUT)

logger.info "Wait for localstack"
while true
  begin
    logger.info 'Try connect'
    resp = Net::HTTP.get(URI('http://0.0.0.0:4566'))
    logger.info 'Connect success'
    break
  rescue StandardError => e
    logger.info "Fail #{e.message}"
    sleep 1
  end
end

sqs = Aws::SQS::Client.new(
  region: 'us-west-1',
  access_key_id: 'test',
  secret_access_key: 'test',
  endpoint: 'http://localhost:4566'
)
logger.info "Create client"
queue = sqs.create_queue(queue_name: 'ramm.store')
logger.info "Create queue, queue_name: #{queue.queue_url}"
logger.info 'Ready'

while true
  resp = sqs.receive_message(
    queue_url: queue.queue_url,
    max_number_of_messages: 1
  )

  resp.messages.each do |m|
    logger.info "Message received: #{m.body}"
    begin
      message = JSON.parse(m.body, symbolize_names: true)
      event = EventBuilder.new(message: message).call
      if event.valid?
        logger.info 'Validation: SUCCESS'
      else
        logger.error 'Validation: FAIL'
        logger.error event.errors
      end
    rescue JSON::ParserError
      logger.error 'Message body is NOT valid json'
    rescue EventUnsupported => e
      logger.error e
    rescue StandardError => e
      logger.error e
    end
  end

  resp.messages.each do |m|
    sqs.delete_message(
      queue_url: queue.queue_url,
      receipt_handle: m.receipt_handle
    )
  end

  sleep 2
end
