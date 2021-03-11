FactoryBot.define do
  factory :trade, class: Hash do
    id { '1' }
    id_client { '2' }
    symbol { 'EURUSD' }
    strategytags { 'tag' }
    type { '3' }
    volume { 1.0 }
    account_type { 'wallet' }
    dt { Time.now }
    price { 0.1 }
    commissionliquidity { 0.01 }
    trader_commission { 0.01 }
    swap { 1.0 }
    profit { 1.0 }
    idaccount { '4' }
    entry { 'IN' }

    initialize_with { attributes }
  end
end
