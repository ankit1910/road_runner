companies = Company.create([{ name: 'Flipkart', api_key: 'fpkart' }, { name: 'myntra', api_key: 'myntra' }, { name: 'jabong', api_key: 'jabong' }])
cities = City.create([{ name: 'Delhi', country: 'india'}, { name: 'Kolkata', country: 'india'}, { name: 'Mumbai', country: 'india'})

Company.all.each do |c|
  c.city_ds = cities.pluck(:id)
end

name = ["lavish.mehta", "amitvinsol", "neerajramuka", " ankitbansal", "shiksha.chauhan", "chhavi.khandelwal", "divyatalwar", "jatin.baweja", "live:pramod_sharma", "sahilbathla", "vidit.jain.91", "vinsolshruti", "yukti_khurana", "nancy05957", "akshay.chhikara", "ankitrana"]
index = 0

Company.all.each do |company|
  company.cities.each do |city|
    city.drivers.create({ name: name[index], age: 30, company_id: company.id })
    index += 1
  end
end


{"delivery":{"package_number":123, "city":"delhi", "address":"rohini"}, "api_key":"myntra"}
