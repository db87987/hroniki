class Tag < ActiveRecord::Base
  
  default_scope order('title ASC')
  
  attr_accessible :title
  
  has_many :hronik_tags
  has_many :hroniks, through: :hronik_tags
  
  has_many :article_tags
  has_many :articles, through: :article_tags
  
  has_many :old_tags
  has_many :olds, through: :old_tags
end
