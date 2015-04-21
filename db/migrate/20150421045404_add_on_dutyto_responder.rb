class AddOnDutytoResponder < ActiveRecord::Migration
  def change
    add_column :responders, :on_duty, :boolean
    change_column_default :responders, :on_duty, false
  end
end
