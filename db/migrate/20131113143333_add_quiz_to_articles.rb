class AddQuizToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :quiz_id, :integer
  end
end
