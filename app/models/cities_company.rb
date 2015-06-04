class CitiesCompany < ActiveRecord::Base
  belongs_to :city
  belongs_to :company
end
