json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :type, :email, :telephone, :mensagem, :status
  json.url contact_url(contact, format: :json)
end
