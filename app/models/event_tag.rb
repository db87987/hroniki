class EventTag < ActiveRecord::Base
  attr_accessible :event_id, :tag_id

  belongs_to :event
  belongs_to :tag
end
