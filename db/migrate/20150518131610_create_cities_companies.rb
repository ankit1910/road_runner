class CreateCitiesCompanies < ActiveRecord::Migration
  def change
    create_table :cities_companies do |t|
      t.references :city, index: true
      t.references :company, index: true

      t.timestamps
    end
  end
end
