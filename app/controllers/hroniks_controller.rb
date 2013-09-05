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
    hash = Digest::MD5.hexdigest(api_secret+params[:date]+params[:num]+params[:last_comment])
    if hash == params[:sign]
      @hronik = Hronik.find(params[:id])
      @hronik.comments_qty = params[:num]
      @hronik.save
    else
      raise "error"
    end
    

  end
  
  def index
    @hroniks = Hronik.all
  end
  
end
