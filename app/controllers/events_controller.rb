class EventsController < ApplicationController
  def index
    @events_by_date = (Article.published.all + Hronik.published.all).group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @hroniks = Hronik.published.limit(3)
    if params[:date] 
      @calendar_elements = Event.published.where(:date => params[:date]).sort_by{|e| e[:date]}.reverse 
    else
      @calendar_elements = Event.published.where(:date => Time.now).sort_by{|e| e[:date]}.reverse 
    end
  end

  def show
    @hroniks = Hronik.published.limit(3)
    
    @events_by_date = (Article.published.all + Hronik.published.all).group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    
    @event = Event.find(params[:id])
    session_id = request.session_options[:id]
    begin
      EventView.create(:event_id => @event.id, :session_id => session_id)
    rescue ActiveRecord::RecordNotUnique
      nil
    end
  end
end
