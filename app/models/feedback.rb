class Feedback < ActiveRecord::Base
  attr_accessible :comment, :feedback, :name, :published, :feedback_type, :sn
  scope :published, -> { where(published: true) }
  FEEDBACK_TYPES = %w[like unlike]
  default_scope order('sn ASC')
end
