class StaticPagesController < ApplicationController
  def index
    @slider_hroniks = Hronik.published.order('created_at DESC').limit(5)
    @elements = ((Article.published.all + Hronik.published.all).sort_by{|e| e[:date]} + Old.published.all).paginate(:page => params[:page], :per_page => 3)
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
