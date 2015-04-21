class CreateResponders < ActiveRecord::Migration
  def change
    create_table :responders, id: false, force: true do |t|
      t.string :name, null: false
      t.string :type
      t.integer :capacity

      t.timestamps null: false
    end

    add_index :responders, ["name"], name: "index_responders_on_name", unique: true, using: :btree
  end
end
