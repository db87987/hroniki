# coding: utf-8

class Hronik < ActiveRecord::Base
  attr_accessible :cover, :date, :text, :title, :tag_ids, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  has_many :hronik_tags
  has_many :tags, through: :hronik_tags
  
  has_many :session_hroniks
  
  validates :date, :text, :title, presence: true
    
  has_attached_file :cover, :styles => { 
    :ico => {:geometry => "100x100#"}, 
    :side => {:geometry => "220x220#"},
    :gallery => {:geometry => "300x300#"},
    :show => {:geometry => "640x460>"},
    :main => {:geometry => "940x510#", :processors => [:cropper]}
  }
  
  after_update :reprocess_cover, :if => :cropping? 
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def cover_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(cover.path(style))
  end
  
  
  
  private
  
  def reprocess_cover
    cover.assign(cover)
    cover.save
  end
end
