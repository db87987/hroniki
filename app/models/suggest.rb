class Suggest < ActiveRecord::Base
  attr_accessible :approved, :author, :comment, :date, :image, :text, :title
  
  has_attached_file :image, :styles => { :card => "640x480#", :ico => "100x100#" }
end
