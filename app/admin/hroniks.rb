# coding: utf-8

ActiveAdmin.register Hronik do
  
  
  
  filter :from_visitor, as: :select, collection: [[I18n.t('from_guest'), 'true'], [I18n.t('from_moderator'), 'false']]
  config.batch_actions = false
  config.sort_order = "created_at_desc"

  
  # scope :all, :default => true
  # scope :from_visitor
  # scope :from_moderator, :twers => '213213'
  
   index do
     column :author
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
       f.input :moderated
       f.input :cover, :as => :file, :hint => ( f.object.new_record? || !f.object.cover ) ? nil : image_tag(f.object.cover.url(:ico))
       f.input :short, :input_html => { :rows => 2  }
       f.input :text, :as => :ckeditor, :label => false
     end
     
     f.inputs t('tags') do
       f.input :tags
     end
     f.actions
   end

  show do |hronik|
    attributes_table do
      row :title
      row :published
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
      row :author
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
  
  member_action :repost do
    @hronik = Hronik.find(params[:id])
    text = strip_tags(@hronik.text).gsub(/&quot;/i,"").gsub(/&nbsp;/i,"")
		text = truncate(text, length: 260, omission: '...')
    # link = '<a href="http://hroniki.org/hroniks/#{@hronik.id}">читать далее'.html_safe
    # text = text + " " + link 
    SocialPoster.write(:vk, text, nil, owner_id: '-57352679')
    redirect_to :back, :notice => I18n.t('successfully_reposted')
  end
  
  action_item :only => :show do
     link_to(I18n.t('repost'), repost_admin_hronik_path(hronik))
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
