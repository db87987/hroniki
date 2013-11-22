class Article < ActiveRecord::Base
  attr_accessible :date, :image, :text, :title, :tag_ids, :published, :quiz_id,
                  :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  default_scope order('date DESC')
  
  has_many :article_tags
  has_many :tags, through: :article_tags
  has_many :article_views
  
  scope :published, -> { where(published: true) }  
  
  validates :date, :text, :title, presence: true
  
  has_attached_file :image, :styles => { 
    :ico => {:geometry => "100x100#", :processors => [:cropper]}, 
    :side => {:geometry => "220x220#", :processors => [:cropper]},
    :gallery => {:geometry => "300x300#", :processors => [:cropper]},
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
