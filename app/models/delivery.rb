class Delivery < ActiveRecord::Base
  belongs_to :company
  belongs_to :city
end
