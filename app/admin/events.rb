ActiveAdmin.register Event do
  config.batch_actions = false
  config.sort_order = "created_at_desc"
  filter :guest, :as => :select
  
   index do
     column :id
     column :title
     column :date
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
       f.input :date
       f.input :published
       f.input :image, :as => :file, :hint => ( f.object.new_record? || !f.object.image ) ? nil : image_tag(f.object.image.url(:ico))
       f.input :text, :as => :ckeditor, :label => false
     end
     
     f.inputs t('tags') do
       f.input :tags
     end
     f.actions
   end

  show do |article|
    attributes_table do
      row :title
      row :published
      row :date
      row :cover do |cover|
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
   
   member_action :crop do
     @event = Event.find(params[:id])
   end
   
   controller do

     def create
       @event = Event.new(params[:event])
       if @event.save
         if params[:event][:image].blank?
           redirect_to admin_event_path(@event)
         else
           render :action => "crop", :layout => 'active_admin' 
         end
       else
         render :action => 'new'
       end
     end

     def update
       @event = Event.find(params[:id])
       if @event.update_attributes(params[:event])
         if params[:event][:image].blank?
           redirect_to admin_event_path(@event)
         else
           render :action => "crop", :layout => 'active_admin' 
         end
       else
         render :action => 'edit'
       end
     end

   end
end
