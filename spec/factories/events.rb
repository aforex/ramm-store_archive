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

    trait :wallet_is_create do
      type { 'event_wallet_is_create' }
      data do
        {
          wallet: build(:wallet)
        }
      end
    end

    trait :wallet_payment do
      type { 'event_wallet_payment' }
      data do
        {
          trade: build(:trade),
          wallet: build(:wallet)
        }
      end
    end

    initialize_with { attributes }
  end
end
