class SuggestsController < ApplicationController
  def create
    @suggest = Suggest.new(params[:suggest])
    if @suggest.save
      result = {status: 'ok'}
    else
      result = {errors: @suggest.errors.full_messages}
    end
    render json: result
  end
end
