class Change2ColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :creator, :creator_id
  end
end
