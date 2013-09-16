class Feedback < ActiveRecord::Base
  attr_accessible :comment, :feedback, :name, :published, :type
end
