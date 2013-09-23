class OldsController < ApplicationController
  def index
    @olds = Old.all
  end
  
  def issue
    @olds = Old.where(:issue_id => params[:issue_id])
    render 'index'
  end

  def show
    @hroniks = Hronik.limit(3)
    
    @events_by_date = (Article.all + Hronik.all + Old.all).group_by(&:date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    
    @old = Old.find(params[:id])
    session_id = request.session_options[:id]
    begin
      OldView.create(:old_id => @old.id, :session_id => session_id)
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
      @old = Old.find(params[:id])
      @old.comments_qty = params[:num]
      @old.save
    else
      nil
    end
    render nothing: true
  end
end
