json.array!(@cities) do |city|
  json.extract! city, :id, :name, :country, :pincode
  json.url city_url(city, format: :json)
end
