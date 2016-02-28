json.array!(@offerts) do |offert|
  json.extract! offert, :id, :company_id, :have, :exchange, :status, :user_id, :obs
  json.url offert_url(offert, format: :json)
end
