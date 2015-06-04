json.array!(@companies) do |company|
  json.extract! company, :id, :name, :api_key
  json.url company_url(company, format: :json)
end
