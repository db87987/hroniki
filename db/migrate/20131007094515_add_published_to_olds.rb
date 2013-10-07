class AddPublishedToOlds < ActiveRecord::Migration
  def change
    add_column :olds, :published, :boolean, :default => false
    Old.all.each do |old|
      old.published = true
      old.save!
    end
  end
end
