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
    @hronik = Hronik.find(params[:id])
    @hronik.comments_qty = params[:num]
    @hronik.save
  end
  
  def index
    @hroniks = Hronik.all
  end
  
end
