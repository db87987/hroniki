ActiveAdmin.register Quiz do
  config.batch_actions = false
  config.clear_sidebar_sections!
  
   index do 
     column :title
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
     end
     f.inputs do
       f.has_many :answers do |attachment_form|      
         attachment_form.input :text
         attachment_form.input :_destroy, :as => :boolean, :required => false, :label => I18n.t('destroy')
       end
     end

     f.actions
   end

  show do |quiz|
    attributes_table do
      row :title
    end  
    
    panel t('answers') do 
      table_for quiz.answers do 
        column :text
        column :rate
      end
    end
   end
end
