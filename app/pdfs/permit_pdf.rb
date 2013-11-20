# coding: utf-8
class PermitPdf < Prawn::Document
  include ActionView::Helpers::SanitizeHelper

  def remove_html(string)
    sanitize(string, :tags => {}).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"") # empty tags hash tells it to allow no tags
  end
  
  def initialize(permit, view)
    super(margin: 0, :page_size => [595, 420])
    @permit = permit
    @view = view
    @drivers = @permit.vehicle.users
    @driver = @drivers.first
    russian_font
    
    if @permit.start_date == @permit.expiration_date
      float {image "#{Rails.root}/app/assets/images/propusk_temporary.jpg"}
      
      font "Verdana"
      draw_text "#{@permit.expiration_date.strftime('%d.%m.%y')}", :size => 30, :at => [425,285]
      draw_text "№#{@permit.number}", :size => 25, :at => [500,250]
      
      font "RoadNumbers"
      draw_text "#{@permit.vehicle.register_sn}", :size => 80, :at => [228,115]
      draw_text "#{@permit.vehicle.sn_region}", :size => 55, :at => [474,130]
      
      
    else
      float {image "#{Rails.root}/app/assets/images/propusk_back.jpg"}
      
      move_down 140

      font "Verdana"
      draw_text "№#{@permit.number}", :size => 25, :at => [484,262]

      font "RoadNumbers"
      draw_text "#{@permit.vehicle.register_sn}", :size => 80, :at => [44,100]
      draw_text "#{@permit.vehicle.sn_region}", :size => 55, :at => [288,117]
  
    end

    
    start_new_page
    font "Verdana"
    float {image "#{Rails.root}/app/assets/images/propusk_front.jpg"}
    draw_text "#{@driver.last_name}", :size => 20, :at => [160,360]
    draw_text "#{@driver.first_name}   #{@driver.middle_name}", :size => 20, :at => [160,300]
    draw_text "#{@driver.position}", :size => 20, :at => [160,237]
    if @driver.organization_id?
    draw_text "#{Organization.find(@driver.organization_id).title}", :size => 20, :at => [160,180]
    end
    draw_text "#{@permit.vehicle.register_sn} #{@permit.vehicle.sn_region}", :size => 20, :at => [240,120]
    draw_text "#{@permit.expiration_date.strftime('%d.%m.%y')}", :size => 20, :at => [165,65]
    
    
    # text "#{@permit.vehicle.vehicle_title}", :size => 15
    # text "#{@permit.start_date.strftime('%d.%m.%y')} - #{@permit.expiration_date.strftime('%d.%m.%y')}", :size => 15
  end
  

  
  def russian_font
    font_families.update(
      "Verdana" => {
        :bold => "#{Rails.root}/app/assets/fonts/verdanab.ttf",
        :italic => "#{Rails.root}/app/assets/fonts/verdanai.ttf",
        :normal  => "#{Rails.root}/app/assets/fonts/verdana.ttf" },
      "RoadNumbers" => {
            :normal  => "#{Rails.root}/app/assets/fonts/RoadNumbers2.0.ttf" })
    
  end
end