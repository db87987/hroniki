class Issue < ActiveRecord::Base
  attr_accessible :title, :date, :image
  
  validates :title, :date, :image, presence: true
  
  has_attached_file :image, :styles => { :cover => "220x300#", :ico => "100x100#" }
end
