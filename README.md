# StampPdf
## Установка

Добавьте данную строку в Gemfile:

```ruby
gem 'stamp_pdf'
```

Затем выполните:

    $ bundle

## Использование

Создание клиента

```ruby
client = StampPdf::Client.new
```

### Добавить штамп в документ

```ruby
document = 'spec/fixtures/files/claim.pdf'
token = {
  'id' => '123',
  'full_name' => 'Петров Петр Петрович',
  'date_from' => '11.11.2019',
  'date_to' => '11.11.2021'
}
client.add_stamp(document: document, token: token)
```
