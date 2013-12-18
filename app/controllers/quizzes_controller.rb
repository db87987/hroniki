class QuizzesController < ApplicationController
  require 'gchart'
  def quiz
    @quiz = Quiz.find(params[:id])
    answer_id = params[:quiz][:answer]
    @answer = Answer.find(answer_id)
    @answer.rate += 1
    @answer.save
    @line_chart = Gchart.bar(:data => @quiz.answers.pluck(:rate), 
                              :orientation => 'horizontal',
                              :size => '200x150')
    respond_to do |format|
      format.js
    end
  end
  
end
