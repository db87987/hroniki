class Answer < ActiveRecord::Base
  attr_accessible :quiz_id, :text, :rate
  belongs_to :quiz
end
