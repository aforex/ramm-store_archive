class EventUnsupported < StandardError; end

class EventBuilder
  attr_reader :message

  # @params message [Hash]
  def initialize(message:)
    @message = message
  end

  def call
    event_klass.new(data: message[:data])
  end

  private

  def event_klass
    case message[:type]
    when 'event_trade_is_open'
      Events::TradeIsOpen
    else
      raise EventUnsupported.new("Unsupported event <#{message[:type]}>")
    end
  end
end
