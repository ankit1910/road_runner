class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :driver, index: true
      t.references :delivery, index: true

      t.timestamps
    end
  end
end
