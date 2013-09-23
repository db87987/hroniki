class AddIndexesToOldViews < ActiveRecord::Migration
  def change
    add_index :old_views, [:old_id, :session_id], unique: true
    add_index :old_views, :old_id
  end
end
