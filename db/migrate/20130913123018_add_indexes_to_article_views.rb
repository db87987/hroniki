class AddIndexesToArticleViews < ActiveRecord::Migration
  def change
    add_index :article_views, [:article_id, :session_id], unique: true
    add_index :article_views, :article_id
  end
end
