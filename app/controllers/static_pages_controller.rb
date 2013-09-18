class StaticPagesController < ApplicationController
  def index
    @hroniks = Hronik.limit(9)
    @hronik = Hronik.all.sample
  end
  
  def feedback
    @feedback = Feedback.new
    @feedbacks = Feedback.published.order('created_at DESC')
  end
end
