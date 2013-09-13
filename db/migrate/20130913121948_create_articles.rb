class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.date :date
      t.text :text
      t.attachment :image
      t.integer :watched, :default => 0
      t.integer :comments_qty, :default => 0

      t.timestamps
    end
  end
end
