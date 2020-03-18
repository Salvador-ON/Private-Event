class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :location
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
