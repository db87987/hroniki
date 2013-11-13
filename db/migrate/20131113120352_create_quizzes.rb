class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.boolean :hroniks
      t.boolean :articles
      t.boolean :olds

      t.timestamps
    end
  end
end
