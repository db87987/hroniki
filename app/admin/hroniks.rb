ActiveAdmin.register Hronik do
  config.batch_actions = false
  config.clear_sidebar_sections!
  config.sort_order = "created_at_desc"
  
   index do
     column :id
     column :title
     column :date
     column :cover do |column|
       image_tag column.cover.url(:ico)
     end
     column :text do |column| 
       truncate(column.text, length: 600, omission: '...').html_safe
     end
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :date
       f.input :cover, :as => :file, :hint => ( f.object.new_record? || !f.object.cover ) ? nil : image_tag(f.object.cover.url(:ico))
       f.input :text, :as => :ckeditor, :label => false
     end
     f.actions
   end

  show do |hronik|
    attributes_table do
      row :title
      row :date
      row :cover do |cover|
        image_tag hronik.cover.url(:gallery)
      end
      row :text do |text|
        hronik.text.html_safe
      end
    end  
   end
end
