class CreateOldTags < ActiveRecord::Migration
  def change
    create_table :old_tags do |t|
      t.integer :old_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
