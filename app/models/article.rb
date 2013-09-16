class Article < ActiveRecord::Base
  attr_accessible :date, :image, :text, :title
  
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :article_views
  
  validates :date, :text, :title, presence: true
  
  has_attached_file :image, :styles => { :side => "220x220#", :ico => "100x100#", :show => "640x460>" }
end
