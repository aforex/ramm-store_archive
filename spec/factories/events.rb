FactoryBot.define do
  factory :trade_is_open, class: Hash do
    trade

    initialize_with { attributes }
  end
end
