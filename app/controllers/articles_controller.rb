class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show 
    @hroniks = Hronik.limit(3)
    @article = Article.find(params[:id])
    session_id = request.session_options[:id]
    begin
      ArticleView.create(:article_id => @article.id, :session_id => session_id)
    rescue ActiveRecord::RecordNotUnique
      nil
    end
  end

  def comment
      @article = Article.find(params[:id])
      @article.comments_qty = params[:num]
      @article.save
      
      render nothing: true
  end
end
