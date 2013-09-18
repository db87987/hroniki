class AddPublishedToFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :published, :boolean
    add_column :feedbacks, :published, :boolean, :default => false
  end
end
