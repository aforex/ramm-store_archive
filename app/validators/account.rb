module Validators
  # И счет инвестиции, и счет управляющего, и счет инвестора.
  class Account < Dry::Validation::Contract
    # Type - Интересуют, только счета с типом 2, остальные можно не пересылать), так же игнорируем счета с меткой тест.
    params do
      # Логин
      required(:login).value(:string, :filled?)

      # Баланс
      required(:balance).value(:decimal)

      # Эквити
      required(:equity).value(:decimal)

      # Название стратегии
      required(:title).value(:string, :filled?)

      # время регистрации аккаунта
      required(:dt).value(:time)

      # маржа
      required(:margin).value(:decimal)

      # Id клиента которому принадлежит тот или иной счет.
      required(:id_client).value(:string, :filled?)

      # Стратегия в которую мы инвестируем для инвестиций
      required(:master_id).value(:string, :filled?)

      # Логин стратегии в mt5  для инвестиций
      required(:master_login).value(:string, :filled?)

      # cостояние для инвестиции
      required(:state).value(:integer, included_in?: (0..15))

      # статус для инвестиции
      required(:status).value(:integer, included_in?: (0..6))
    end
  end
end
