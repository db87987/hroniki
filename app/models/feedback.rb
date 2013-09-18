class Feedback < ActiveRecord::Base
  attr_accessible :comment, :feedback, :name, :published, :feedback_type
  scope :published, -> { where(published: true) }
  FEEDBACK_TYPES = %w[like unlike]
end
