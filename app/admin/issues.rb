ActiveAdmin.register Issue do
  menu :parent => I18n.t('olds')
  
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  index do
    column :id
    column :title
    column :date
    column :image do |column|
      image_tag column.image.url(:ico)
    end
    default_actions
  end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :date
       f.input :image, :as => :file, :hint => ( f.object.new_record? || !f.object.image ) ? nil : image_tag(f.object.image.url(:ico))
     end
     f.actions
   end

  show do
    attributes_table do 
      row :title
      row :date
      row :image do |row|
        image_tag row.image.url(:cover)
      end
    end  
   end
end
