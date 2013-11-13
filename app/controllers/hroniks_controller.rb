# coding: utf-8

class HroniksController < InheritedResources::Base
  
  def create
    @hronik = Hronik.new(params[:hronik])
    @hronik.from_visitor = true
    @hronik.published = true
    @hronik.tags << Tag.find_by_title('Читательские хроники')
    if verify_recaptcha(:model => @hronik, :message => t('please_enter_correct_data')) && @hronik.save
    # if @hronik.save
      result = {status: 'ok'}
    else
      result = {errors: @hronik.errors.full_messages}
    end
    render json: result
  end
  
  def show 
    calendar
    @hroniks = Hronik.published.limit(3)
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
    #     
    # api_secret = "GfqyAEOfSrOYwssRtbOk"
    # last_comment = params[:last_comment].encode Encoding::WINDOWS_1251
    # hash = Digest::MD5.hexdigest(api_secret+params[:date]+params[:num]+last_comment)
    # sign = params[:sign]
    # if hash == sign
      @hronik = Hronik.find(params[:id])
      @hronik.comments_qty = params[:num]
      @hronik.save
    # else
    #   nil
    # end
    render nothing: true
  end
  
  def index
    @hroniks = Hronik.published.order("date DESC").page(params[:page]).per_page(3)
  end
  
end
