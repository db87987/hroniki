class Quiz < ActiveRecord::Base
  attr_accessible :articles, :hroniks, :olds, :title, :answers_attributes, :answer, :quiz_id
  attr_accessor :answer
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true
end
