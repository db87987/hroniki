ActiveAdmin.register Feedback do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :name
     column :feedback_type
     column :feedback
     column :published
     column :comment
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :feedback
       f.input :published
       f.input :comment
     end
     f.actions
   end

  show do
    attributes_table do
      row :name
      row :feedback_type
      row :feedback
      row :published
      row :comment
    end  
   end  
end