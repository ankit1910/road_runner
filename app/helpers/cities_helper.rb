module CitiesHelper
  def cities_for_select
    cities = []
    City.find_each do |city|
      cities << [city.name, city.id]
    end
    cities
  end
end
