class CreateEmergencies < ActiveRecord::Migration
  def change
    create_table :emergencies, id: false, force: true do |t|
      t.string :code, null: false
      t.integer :fire_severity
      t.integer :police_severity
      t.integer :medical_severity

      t.timestamps null: false
    end

    add_index :emergencies, ["code"], name: "index_emergencies_on_sku", unique: true, using: :btree
  end
end
