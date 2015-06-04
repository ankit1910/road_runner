class Driver < ActiveRecord::Base

  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :city
  belongs_to :company
  has_many :assignments
  has_many :deliveries, through: :assignments
end
