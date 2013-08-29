class CreateHroniks < ActiveRecord::Migration
  def change
    create_table :hroniks do |t|
      t.string :title
      t.date :date
      t.attachment :cover
      t.text :text

      t.timestamps
    end
  end
end
