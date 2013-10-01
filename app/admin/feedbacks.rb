ActiveAdmin.register Feedback do
  config.batch_actions = false
  config.clear_sidebar_sections!
  config.sort_order = "sn_asc"
  
  
   index do 
     column :sn
     column :name
     column :feedback_type
     column :feedback
     column :published
     column :comment
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :sn
       f.input :published
       f.input :feedback
       f.input :comment
     end
     f.actions
   end

  show do
    attributes_table do
      row :sn
      row :name
      row :published
      row :feedback_type
      row :feedback
      
      row :comment
    end  
   end  
end