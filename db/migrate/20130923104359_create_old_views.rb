class CreateOldViews < ActiveRecord::Migration
  def change
    create_table :old_views do |t|
      t.integer :old_id
      t.string :session_id

      t.timestamps
    end
  end
end
