class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :age
      t.references :city, index: true
      t.references :company, index: true

      t.timestamps
    end
  end
end
