FactoryBot.define do
  factory :event, class: Hash do
    uuid { generate :uuid }
    sent_at { Time.now }
    version { '1' }
    publisher { 'ramm' }

    trait :trade_is_open do
      type { 'event_trade_is_open' }
      data do
        {
          trade: build(:trade)
        }
      end
    end

    initialize_with { attributes }
  end
end
