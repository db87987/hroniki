class Old < ActiveRecord::Base
  attr_accessible :date, :issue_id, :sn, :text, :title, :image, :tag_ids
  default_scope order('created_at DESC')
  
  has_many :old_tags
  has_many :tags, through: :old_tags
  has_many :old_views
  
  belongs_to :issue
  
  validates :text, :title, :issue_id, presence: true
  
  has_attached_file :image, :styles => { :side => "220x220#", :gallery => "300x300#", :ico => "100x100#", :show => "640x460>" }
end
