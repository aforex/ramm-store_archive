module Validators
  class Trade < Dry::Validation::Contract
    params do
      # Идентификатор сделки
      required(:id).value(:string, :filled?)

      # Идентификатор клиента
      required(:id_client).value(:string, :filled?)

      # Идентификатор котируемых инструментов EURUSD
      required(:symbol).value(:string, :filled?)

      # Кастомные теги стратегии которые мы выставляем в Amarkets
      required(:strategytags).value(:string, :filled?)

      # Тип сделки
      required(:type).value(:string, :filled?)

      # Объем сделки
      required(:volume).value(:decimal)

      # тип счета - wallet \ investment
      required(:account_type).value(:string, included_in?: %w[wallet inversment])

      # Время сделки (в RAMM время открытияне отличаются)
      required(:dt).value(:time)

      # Цена сделки (в RAMM цена открытияне отличаются)
      required(:price).value(:decimal)

      # размер комиссии
      required(:commissionliquidity).value(:decimal)

      # прибыль управляющего
      required(:trader_commission).value(:decimal)

      # Размер Swap
      required(:swap).value(:decimal)

      # Прибыль
      required(:profit).value(:decimal)

      # Иденнтификатор инвестиции
      required(:idaccount).value(:string, :filled?)

      # IN \ OUT \ INOUT
      required(:entry).value(:string, included_in?: %[IN OUT INOUT])
    end
  end
end
