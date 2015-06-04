class City < ActiveRecord::Base

  # Validations
  validates :name, :country, :pincode, presence: true

  # Associations
  has_many :cities_companies
  has_many :companies, through: :cities_companies
  has_many :drivers
end
