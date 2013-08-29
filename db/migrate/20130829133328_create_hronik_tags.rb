class CreateHronikTags < ActiveRecord::Migration
  def change
    create_table :hronik_tags do |t|
      t.integer :hronik_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
