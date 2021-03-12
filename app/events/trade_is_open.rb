module Events
  class TradeIsOpen < BaseEvent
    private

    def validate!
      return @errors if defined? @errors

      validate_trade!
    end
  end
end
