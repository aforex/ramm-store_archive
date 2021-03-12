module Events
  class BaseEvent
    attr_reader :data, :errors

    # @params data [Hash]
    def initialize(data:)
      @data = data
    end

    def valid?
      validate!
      @errors.empty?
    end

    private

    def trade
      @trade ||= data[:trade]
    end

    # @return [Boolean]
    def validate_trade!
      if trade.nil?
        @errors = { trade: 'Trade must be filled' }
        return
      end

      if !trade.is_a?(Hash)
        @errors = { trade: 'Trade must be a Hash' }
        return
      end

      @errors = {}
      trade_errors = Validators::Trade.new.call(**trade).errors.to_h
      @errors[:trade] = trade_errors unless trade_errors.empty?

      @errors.empty?
    end
  end
end
