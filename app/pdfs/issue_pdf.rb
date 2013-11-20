# coding: utf-8
class IssuePdf < Prawn::Document
  include ActionView::Helpers::SanitizeHelper

  def russian_font
    font_families.update(
      "serif" => {
        :bold => "#{Rails.root}/app/assets/fonts/pt_serif_bold.ttf",
        :normal  => "#{Rails.root}/app/assets/fonts/pt_serif_regular.ttf" },
      "sans" => {
        :bold => "#{Rails.root}/app/assets/fonts/pt_sans_bold.ttf",
        :normal  => "#{Rails.root}/app/assets/fonts/pt_sans_regular.ttf" })
  end

  def remove_html(string)
    sanitize(string, :tags => {}).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"") # empty tags hash tells it to allow no tags
  end
  
  def initialize(issue, view)
    russian_font
    super(top_margin: 30)
    @issue = issue
    @olds = issue.olds
    
    
    font "serif"
    text "#{@issue.title}", :align => :center, :size => 38, :style => :bold, :inline_format => true
    text "#{Russian::strftime(@issue.date, "%B %Y")}", :align => :center, :size => 38, :style => :bold, :inline_format => true
    move_down 20
    
    @olds.each do |old|
      font "serif"
      text "#{old.title}", :align => :center, :size => 30, :inline_format => true
      move_down 10
      
      font "sans"
      text "#{old.text}", :align => :left, :size => 16, :inline_format => true
      move_down 30
    end
    
    
  end
  

  
end