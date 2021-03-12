class EventUnsupported < StandardError; end

class EventBuilder
  attr_reader :message

  # @params message [Hash]
  def initialize(message:)
    @message = message
  end

  def call
    Event.new(
      data: message[:data],
      validations: validations
    )
  end

  private

  ACCOUNT = %i[account].freeze
  TRADE = %i[trade].freeze
  WALLET = %i[wallet].freeze

  VALIDATIONS = {
    trade_is_open: TRADE,
    trade_is_close: TRADE,
    trade_is_change: TRADE,
    wallet_is_create: WALLET,
    wallet_is_close: WALLET,
    wallet_payment: WALLET+TRADE,
    wallet_withdrawal: WALLET+TRADE,
    investment_create: ACCOUNT,
    investment_pause: ACCOUNT,
    investment_start: ACCOUNT,
    investment_close: ACCOUNT,
    investment_payment: ACCOUNT+TRADE,
    investment_withdrawal: ACCOUNT+TRADE,
  }.freeze

  def validations
    raise_type_error unless message[:type].start_with?('event_')

    type = message[:type]
      .gsub(/\Aevent_/, '')
      .to_sym
    raise_type_error unless VALIDATIONS.key?(type)

    VALIDATIONS[type]
  end

  def raise_type_error
    raise EventUnsupported.new("Unsupported event type <#{message[:type]}>")
  end
end
