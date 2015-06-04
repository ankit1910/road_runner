class Company < ActiveRecord::Base

  # Validations
  validates :name, :api_key, presence: true

  # Associations
  has_many :cities_companies
  has_many :cities, through: :cities_companies
  has_many :drivers

  # Callbacks
  before_validation :set_api_key

  private
    def set_api_key
      self.api_key = name.downcase.gsub(' ', '_')
    end
end
