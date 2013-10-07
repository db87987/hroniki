class AddPublishedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean, :default => false
    Article.all.each do |article|
      article.published = true
      article.save!
    end
  end
end
