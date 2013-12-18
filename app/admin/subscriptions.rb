ActiveAdmin.register Subscription do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
  
  
   index do 
     column :name
     column :birth
     column :profession
     column :index
     column :address

     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :name
       f.input :birth
       f.input :profession
       f.input :index
       f.input :address
       f.input :email
     end
     f.actions
   end

  show do
    attributes_table do
      row :name
      row :birth
      row :profession
      row :index
      row :address
      row :email
      row :created_at
    end  
   end

end
