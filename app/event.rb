class Event
  attr_reader :errors

  # @params data [Hash]
  # @params validates [Array<symbol>]
  def initialize(data:, validations:)
    @data = data
    @validations = validations
  end

  def valid?
    validate!
    @errors.empty?
  end

  private

  attr_reader :data, :validations

  def validate!
    return @errors if defined? @errors

    validations.all? do |name|
      validate_item!(name: name)
    end
  end

  def item_by(name:)
    @item ||= {}
    @item[name] = data[name.to_sym]
  end

  # @return [Boolean]
  def validate_item!(name:)
    item = item_by(name: name)
    name_string = name.to_s.capitalize

    if item.nil?
      @errors = { name => "#{name_string} must be filled" }
      return
    end

    if !item.is_a?(Hash)
      @errors = { name => "#{name_string} must be a Hash" }
      return
    end

    @errors = {}
    errors_hash = Validators::Trade.new.call(item).errors.to_h
    @errors[name] = errors_hash unless errors_hash.empty?

    @errors.empty?
  end

  def validator_klass(name:)
    case name
    when :account then Validators::Account
    when :trade then Validators::Trade
    when :wallet then Validators::Wallet
    else
      raise "Unknown item #{name}"
    end
  end
end
