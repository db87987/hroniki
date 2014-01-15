class Old < ActiveRecord::Base
  attr_accessible :date, :issue_id, :sn, :text, :title, :image, :tag_ids, :published,
                  :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  default_scope order('date DESC')
  before_create :dublicate_date
  
  has_many :old_tags
  has_many :tags, through: :old_tags
  has_many :old_views
  
  belongs_to :issue
  
  scope :published, -> { where(published: true) }  
  
  validates :text, :title, :issue_id, presence: true
  
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
  
  def dublicate_date
    self.date = Time.now
  end
  
  def reprocess_image
    image.assign(image)
    image.save
  end
  
end
