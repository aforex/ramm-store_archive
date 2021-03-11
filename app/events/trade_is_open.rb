module Events
  class TradeIsOpen
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

    def validate!
      return @errors if defined? @errors

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
    end

    def trade
      @trade ||= data[:trade]
    end
  end
end
