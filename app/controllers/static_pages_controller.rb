class StaticPagesController < ApplicationController
  def index
    @hroniks = Hronik.limit(9)
    @hronik = Hronik.all.sample
  end
  
  def feedback
    @feedback = Feedback.new
    @feedbacks = Feedback.published.order('created_at DESC')
  end
  
  def calendar
    @hroniks = Hronik.where(:date => params[:date])
    @articles = Article.where(:date => params[:date])
  end
  
  def tags
    @hroniks = Hronik.includes(:tags).where("tags.id" => params[:tag_ids]) 
    @articles = Article.includes(:tags).where("tags.id" => params[:tag_ids]) 
    @olds = Old.includes(:tags).where("tags.id" => params[:tag_ids]) 
  end
end
