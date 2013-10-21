class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :text
      t.attachment :image
      t.integer :comments_qty, :default => 0
      t.boolean :published, :default => false

      t.timestamps
    end
  end
end
