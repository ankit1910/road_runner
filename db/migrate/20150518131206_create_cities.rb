class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :country
      t.integer :pincode

      t.timestamps
    end
  end
end
