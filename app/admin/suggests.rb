ActiveAdmin.register Suggest do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :title
     column :date
     column :comment
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :approved
     end
     f.actions
   end

  show do
    attributes_table do
      row :date
      row :title
      row :comment
      row :text
      row :author
    end  
   end

end
