class AddWatchedToHroniks < ActiveRecord::Migration
  def change
    add_column :hroniks, :watched, :integer, :default => 0
  end
end
