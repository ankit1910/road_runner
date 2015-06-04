json.array!(@drivers) do |driver|
  json.extract! driver, :id, :name, :age, :city_id, :company_id
  json.url driver_url(driver, format: :json)
end
