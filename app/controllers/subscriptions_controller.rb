class SubscriptionsController < ApplicationController
  
  def create
      @subscription = Subscription.new(params[:subscription])
      
      respond_to do |format|  
        if verify_recaptcha(:model => @subscription, :message => t('please_enter_correct_data')) && @subscription.save
          format.js
        end
      end
  end
  
end
