class AddPublishedToHroniks < ActiveRecord::Migration
  def change
    add_column :hroniks, :published, :boolean, :default => false
  end
end
