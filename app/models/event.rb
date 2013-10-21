class Event < ActiveRecord::Base
  attr_accessible :date, :text, :title, :image, :tag_ids, :published
  scope :published, -> { where(published: true) }  
  has_many :event_tags
  has_many :tags, through: :event_tags
  has_many :event_views
  
  has_attached_file :image, :styles => { :side => "220x220#", :gallery => "300x300#", :ico => "100x100#", :show => "640x460>" }
end
