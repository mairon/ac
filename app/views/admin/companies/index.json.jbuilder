json.array!(@companies) do |company|
  json.extract! company, :id, :name, :telephone, :longitude, :latitude, :city_id, :country_id, :state_id, :about, :address, :website, :schedule_id, :user_id
  json.url company_url(company, format: :json)
end
