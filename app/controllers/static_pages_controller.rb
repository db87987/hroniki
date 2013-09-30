class StaticPagesController < ApplicationController
  def index
    @slider_hroniks = Hronik.published.limit(3)
    @hroniks = Hronik.published.limit(9)
  end
  
  def feedback
    @feedback = Feedback.new
    @feedbacks = Feedback.published.order('created_at DESC')
  end
  
  def calendar
    @hroniks = Hronik.published.where(:date => params[:date])
    @articles = Article.where(:date => params[:date])
  end
  
  def tags
    @hroniks = Hronik.published.includes(:tags).where("tags.id" => params[:tag_ids]) 
    @articles = Article.includes(:tags).where("tags.id" => params[:tag_ids]) 
    @olds = Old.includes(:tags).where("tags.id" => params[:tag_ids]) 
  end
end
