class DriverSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :token, :tasks

  def tasks
    object.deliveries.where(status: 1)
  end
end
