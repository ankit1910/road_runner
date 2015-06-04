class Assignment < ActiveRecord::Base
  belongs_to :driver
  belongs_to :delivery

  after_create :set_delivery_status
  before_destroy :reset_delivery_status

  private
    def set_delivery_status
      delivery.update(status: 1)
    end
    def reset_delivery_status
      delivery.update(status: 0)
    end
end
