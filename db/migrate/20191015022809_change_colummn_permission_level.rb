class ChangeColummnPermissionLevel < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :permission_level, from: nil , to: 1
  end
end
