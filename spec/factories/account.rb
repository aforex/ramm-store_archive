FactoryBot.define do
  factory :account, class: Hash do
    login { '123' }
    balance { 1.0 }
    equity { 0.0 }
    title { 'test' }
    dt { Time.now }
    margin { 0.0 }
    id_client { '456' }
    master_id { '789' }
    master_login { '012' }
    state { 0 }
    status { 1 }

    initialize_with { attributes }
  end
end
 
