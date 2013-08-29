class Hronik < ActiveRecord::Base
  attr_accessible :cover, :date, :text, :title
  
  has_many :hronik_tags
  has_many :tags, through: :hronik_tags
  
  has_many :session_hroniks
  
  has_attached_file :cover, :styles => { :main => "940x510#",:gallery => "300x300#", :ico => "100x100#" } 
end
