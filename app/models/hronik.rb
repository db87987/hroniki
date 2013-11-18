# coding: utf-8

class Hronik < ActiveRecord::Base
  attr_accessible :cover, :date, :text, :title, :tag_ids, :crop_x, :crop_y, :crop_w, :crop_h, 
                  :short, :published, :from_visitor, :moderated, :author
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  default_scope order('date DESC')
  
  has_many :hronik_tags
  has_many :tags, through: :hronik_tags
  
  has_many :session_hroniks
  
  scope :published, -> { where(published: true) }  
  scope :from_visitor, -> { where(from_visitor: true)}
  scope :from_moderator, -> { where(from_visitor: false)}
  
  validates :date, :text, :title, presence: true
    
  has_attached_file :cover, :styles => { 
    :ico => {:geometry => "100x100#"}, 
    :side => {:geometry => "220x220#"},
    :gallery => {:geometry => "300x300#"},
    :show => {:geometry => "640x460>"},
    :main => {:geometry => "940x510#", :processors => [:cropper]}
  }
  # process_in_background :cover
  
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
