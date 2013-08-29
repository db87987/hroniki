class Tag < ActiveRecord::Base
  attr_accessible :title
  
  has_many :hronik_tags
  has_many :hroniks, through: :hronik_tags
end
