json.array!(@deliveries) do |delivery|
  json.extract! delivery, :id, :package_number, :company_id, :city_id, :status, :date_of_delivery, :address
  json.url delivery_url(delivery, format: :json)
end
