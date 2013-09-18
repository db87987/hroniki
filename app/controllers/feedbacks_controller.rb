class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      result = {status: 'ok'}
    else
      result = {errors: @feedback.errors.full_messages}
    end
    render json: result
  end
    
end
