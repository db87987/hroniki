class Event < ActiveRecord::Base
  attr_accessible :date, :text, :title, :image, :tag_ids, :published, :author,
                  :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  scope :published, -> { where(published: true) }  
  has_many :event_tags
  has_many :tags, through: :event_tags
  has_many :event_views
  
  has_attached_file :image, :styles => { 
    :ico => {:geometry => "100x100#"}, 
    :side => {:geometry => "220x220#", :processors => [:cropper]},
    :gallery => {:geometry => "300x300#"},
    :show => {:geometry => "640x460>"}
  }
  
  after_update :reprocess_image, :if => :cropping? 
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(image.path(style))
  end
  
  private
  
  def reprocess_image
    image.assign(image)
    image.save
  end
end
