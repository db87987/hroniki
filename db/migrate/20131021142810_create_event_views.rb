class CreateEventViews < ActiveRecord::Migration
  def change
    create_table :event_views do |t|
      t.integer :event_id
      t.string :session_id

      t.timestamps
    end
  end
end
