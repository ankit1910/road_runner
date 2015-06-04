class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.integer :package_number
      t.references :company, index: true
      t.references :city, index: true
      t.integer :status
      t.datetime :date_of_delivery
      t.string :address

      t.timestamps
    end
  end
end
