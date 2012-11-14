class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :contact
      t.integer :serialNumber
      t.string :hardwareVersion
      t.string :softwareVersion
      t.integer :dbVersion

      t.timestamps
    end
  end
end
