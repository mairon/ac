json.array!(@standard_exchanges) do |standard_exchange|
  json.extract! standard_exchange, :id, :currency_want, :currency_have, :operation
  json.url standard_exchange_url(standard_exchange, format: :json)
end
