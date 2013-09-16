class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :type
      t.text :feedback
      t.text :comment
      t.boolean :published

      t.timestamps
    end
  end
end
