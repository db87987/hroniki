class CreateArticleViews < ActiveRecord::Migration
  def change
    create_table :article_views do |t|
      t.integer :article_id
      t.integer :session_id

      t.timestamps
    end
  end
end
