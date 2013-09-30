class ArticlesController < ApplicationController
  def index
    @articles = Article.order("date DESC").page(params[:page]).per_page(3)
  end

  def show 
    @hroniks = Hronik.limit(3)
    
    @events_by_date = (Article.all + Hronik.all).group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    
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
      render nothing: true
  end
end
