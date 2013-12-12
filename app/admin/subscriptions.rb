ActiveAdmin.register Subscription do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  
  
   index do 
     column :name
     column :birth
     column :profession
     column :index
     column :address
     column :created_at

     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :name
       f.input :birth
       f.input :profession
       f.input :index
       f.input :address
     end
     f.actions
   end

  show do
    attributes_table do
      row :title
      row :name
      row :birth
      row :index
      row :title
      row :address
    end  
   end

end
