class HroniksController < InheritedResources::Base
  
  def show 
    @hroniks = Hronik.limit(3)
    
    @events_by_date = (Article.all + Hronik.all).group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    
    @hronik = Hronik.find(params[:id])
    session_id = request.session_options[:id]
    begin
      SessionHronik.create(:hronik_id => @hronik.id, :session_id => session_id)
    rescue ActiveRecord::RecordNotUnique
      nil
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def comment
        
    api_secret = "GfqyAEOfSrOYwssRtbOk"
    last_comment = params[:last_comment].encode Encoding::WINDOWS_1251
    hash = Digest::MD5.hexdigest(api_secret+params[:date]+params[:num]+last_comment)
    sign = params[:sign]
    if hash == sign
      @hronik = Hronik.find(params[:id])
      @hronik.comments_qty = params[:num]
      @hronik.save
    else
      nil
    end
    render nothing: true
  end
  
  def index
    @hroniks = Hronik.order("date DESC").page(params[:page]).per_page(3)
  end
  
end
