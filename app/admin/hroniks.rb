ActiveAdmin.register Hronik do
  config.batch_actions = false
  filter :from_visitor, :as => :select
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
       f.input :published
       f.input :cover, :as => :file, :hint => ( f.object.new_record? || !f.object.cover ) ? nil : image_tag(f.object.cover.url(:ico))
       f.input :short, :input_html => { :rows => 2  }
       f.input :text, :as => :ckeditor, :label => false
     end
     
     f.inputs t('tags') do
       f.input :tags, :as => :check_boxes
     end
     f.actions
   end

  show do |hronik|
    attributes_table do
      row :title
      row :date
      row :cover do |cover|
        image_tag hronik.cover.url(:main)
      end
      row :cover do |cover|
        image_tag hronik.cover.url(:gallery)
      end
      row :text do |text|
        hronik.text.html_safe
      end
    end  
    panel t('tags') do 
       table_for hronik.tags do 
         column :title do |column|
          column.title
         end
       end
     end
  end
  
  member_action :crop do
    @hronik = Hronik.find(params[:id])
  end
  
  controller do
    
    
    def create
      @hronik = Hronik.new(params[:hronik])
      if @hronik.save
        if params[:hronik][:cover].blank?
          redirect_to admin_hronik_path(@hronik)
        else
          render :action => "crop", :layout => 'active_admin' 
        end
      else
        render :action => 'new'
      end
    end
    
    def update
      @hronik = Hronik.find(params[:id])
      if @hronik.update_attributes(params[:hronik])
        if params[:hronik][:cover].blank?
          redirect_to admin_hronik_path(@hronik)
        else
          render :action => "crop", :layout => 'active_admin' 
        end
      else
        render :action => 'edit'
      end
    end
    
  end
   
   
   
end
