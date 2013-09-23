ActiveAdmin.register Old do
  config.batch_actions = false
  config.clear_sidebar_sections!
  config.sort_order = "created_at_desc"
  menu :parent => I18n.t('olds')
  
   index do
     column :id
     column :title
     column :image do |column|
       image_tag column.image.url(:ico)
     end
     column :text do |column| 
       truncate(column.text, length: 600, omission: '...').html_safe
     end
     default_actions
   end

   form do |f|  
     f.inputs t('properties') do
       f.input :title
       f.input :issue_id, :as => :select, :collection => Issue.all, :prompt => :false
       f.input :image, :as => :file, :hint => ( f.object.new_record? || !f.object.image ) ? nil : image_tag(f.object.image.url(:ico))
       f.input :text, :as => :ckeditor, :label => false
     end
     
     f.inputs t('tags') do
       f.input :tags, :as => :check_boxes
     end
     f.actions
   end

  show do |article|
    attributes_table do
      row :title
      row :issue_id do
        issue = Issue.find(article.issue_id)
        link_to issue.title, admin_issue_path(issue)
      end
      row :image do |cover|
        image_tag article.image.url(:side)
      end
      row :text do |text|
        article.text.html_safe
      end
    end  
    
    panel t('tags') do 
       table_for article.tags do 
         column :title do |column|
          column.title
         end
       end
     end
    
   end  
end
