class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def calendar 
    @events_by_date = (Article.published.all + Hronik.published.all + Event.published.all).group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
