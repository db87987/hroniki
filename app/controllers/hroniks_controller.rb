class HroniksController < InheritedResources::Base
  
  def show 
    @hronik = Hronik.find(params[:id])
    session_id = request.session_options[:id]
    
    begin
      SessionHronik.create(:hronik_id => @hronik.id, :session_id => session_id)
    rescue ActiveRecord::RecordNotUnique
      nil
    end
    
    
  end
  
  
end
