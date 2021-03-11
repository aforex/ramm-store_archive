# local sqs runner & validator
Тестовый сервер для проверки валидности отправляемых в sqs-очередь сообщений

Установка и начало работы:
```
docker-compose up --build
```
после запуска проекта будет доступен локальный sqs-сервис по адресу
http://0.0.0.0:4566
который в логах выводит получаемые сообщения, их валидность, и возникающие
ошибки валидации

Пример ruby-клиента, отправляющего сообщение в очередь
```
require 'aws-sdk-sqs'  # v2: require 'aws-sdk'

sqs = Aws::SQS::Client.new(
  region: 'us-west-1',
  access_key_id: 'test',
  secret_access_key: 'test',
  endpoint: 'http://localhost:4566'
)

puts sqs.send_message(
  queue_url: 'http://localhost:4566/000000000000/ramm.store',
  message_body: {
    uuid: "e8d4e80c-975f-4e3c-bfc0-b989dfc895a7",
    type: "event_trade_is_open",
    sent_at: "2020-02-27T13:49:18Z",
    version: "1",
    publisher: "ramm",
    data: {
      trade: {
        id: '1',
        id_client: '2',
        symbol: 'EURUSD',
        strategytags: 'tag',
        type: '3',
        volume: 1.0,
        account_type: 'wallet',
        dt: Time.now,
        price: 0.1,
        commissionliquidity: 0.01,
        trader_commission: 0.01,
        swap: 1.0,
        profit: 1.0,
        idaccount: '4',
        entry: 'IN'
      }
    }
  }.to_json
)
```
