class HroniksController < InheritedResources::Base
  
  def show 
    @hroniks = Hronik.limit(3)
    @hronik = Hronik.find(params[:id])
    session_id = request.session_options[:id]
    begin
      SessionHronik.create(:hronik_id => @hronik.id, :session_id => session_id)
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
      @hronik = Hronik.find(params[:id])
      @hronik.comments_qty = params[:num]
      @hronik.save
    else
      nil
    end
    render nothing: true
  end
  
  def index
    @hroniks = Hronik.all
  end
  
end
