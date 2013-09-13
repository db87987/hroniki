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
    api_secret = "GfqyAEOfSrOYwssRtbOk"
    last_comment = params[:last_comment].encode Encoding::WINDOWS_1251
    hash = Digest::MD5.hexdigest(api_secret+params[:date]+params[:num]+last_comment)
    sign = params[:sign]
    if hash == sign
      @article = Article.find(params[:id])
      @article.comments_qty = params[:num]
      @article.save
    else
      nil
    end
  end
end
