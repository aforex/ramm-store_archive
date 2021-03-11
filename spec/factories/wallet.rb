FactoryBot.define do
  factory :wallet, class: Hash do
    login { '1' }
    balance { 1.0 }
    equity { 1.0 }
    dt { Time.now }
    id_client { '2' }
    invested { 0.1 }

    initialize_with { attributes }
  end
end
