# coding: utf-8
class OldPdf < Prawn::Document
  include ActionView::Helpers::SanitizeHelper

  def remove_html(string)
    sanitize(string, :tags => {}).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"") # empty tags hash tells it to allow no tags
  end
  
  def initialize(old, view)
    super(top_margin: 30)
    @old = old
    russian_font
    
    font "serif"
    text "#{@old.title}", :align => :center, :size => 38, :style => :bold, :inline_format => true
    text "#{Russian::strftime(@old.date, "%B %Y")}", :align => :center, :size => 38, :style => :bold, :inline_format => true
    move_down 20
    font "sans"
    text "#{@old.text}", :align => :left, :size => 16, :inline_format => true
  
    
    
  end
  
  def russian_font
    font_families.update(
      "serif" => {
        :bold => "#{Rails.root}/app/assets/fonts/pt_serif_bold.ttf",
        :normal  => "#{Rails.root}/app/assets/fonts/pt_serif_regular.ttf" },
      "sans" => {
        :bold => "#{Rails.root}/app/assets/fonts/pt_sans_bold.ttf",
        :normal  => "#{Rails.root}/app/assets/fonts/pt_sans_regular.ttf" })
  end
  
end