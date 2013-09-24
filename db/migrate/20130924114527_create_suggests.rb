class CreateSuggests < ActiveRecord::Migration
  def change
    create_table :suggests do |t|
      t.date :date
      t.text :comment
      t.string :title
      t.text :text
      t.string :author
      t.attachment :image
      t.boolean :approved

      t.timestamps
    end
  end
end
