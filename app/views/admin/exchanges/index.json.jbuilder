json.array!(@exchanges) do |exchange|
  json.extract! exchange, :id, :company_id, :currency_id, :date, :buy, :sale
  json.url exchange_url(exchange, format: :json)
end
