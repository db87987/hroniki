class Issue < ActiveRecord::Base
  attr_accessible :title, :date, :image
  has_many :olds
  validates :title, :date, :image, presence: true
  
  has_attached_file :image, :styles => { :cover => "220x300#", :ico => "100x100#" }
  
  def self.with_olds
    includes(:olds).where('olds.published = ?', true)
  end
end
