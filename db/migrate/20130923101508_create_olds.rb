class CreateOlds < ActiveRecord::Migration
  def change
    create_table :olds do |t|
      t.string :title
      t.date :date
      t.text :text
      t.attachment :image
      t.integer :sn, :default => 1
      t.integer :issue_id
      t.integer :comments_qty, :default => 0

      t.timestamps
    end
  end
end
