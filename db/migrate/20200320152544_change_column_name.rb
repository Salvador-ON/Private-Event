class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :user_id, :creator
  end
end
