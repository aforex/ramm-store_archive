module Validators
  class Wallet < Dry::Validation::Contract
    params do
      # Логин
      required(:login).value(:string, :filled?)

      # Баланс
      required(:balance).value(:decimal)

      # Эквити
      required(:equity).value(:decimal)

      # время регистрации аккаунта
      required(:dt).value(:time)

      # Id клиента которому принадлежит тот или иной счет.
      required(:id_client).value(:string, :filled?)

      # баланс инвестированных торговых средств
      required(:invested).value(:decimal)
    end
  end
end
