class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :package_number, :address
end
