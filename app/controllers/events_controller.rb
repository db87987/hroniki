class EventsController < ApplicationController
  def index
    calendar
    @hroniks = Hronik.published.limit(3)
    if params[:date] 
      @calendar_elements = Event.published.where(:date => params[:date]).sort_by{|e| e[:date]}.reverse 
    else
      @calendar_elements = Event.published.where(:date => Date.today).sort_by{|e| e[:date]}.reverse 
    end
  end

  def show
    calendar
    @hroniks = Hronik.published.limit(3)
    
    @event = Event.find(params[:id])
    session_id = request.session_options[:id]
    begin
      EventView.create(:event_id => @event.id, :session_id => session_id)
    rescue ActiveRecord::RecordNotUnique
      nil
    end
  end
  
  def comment
    # api_secret = "GfqyAEOfSrOYwssRtbOk"
    # last_comment = params[:last_comment].encode Encoding::WINDOWS_1251
    # hash = Digest::MD5.hexdigest(api_secret+params[:date]+params[:num]+last_comment)
    # sign = params[:sign]
    # if hash == sign
      @event = Event.find(params[:id])
      @event.comments_qty = params[:num]
      @event.save
    # else
    #   nil
    # end
    render nothing: true
  end
end
