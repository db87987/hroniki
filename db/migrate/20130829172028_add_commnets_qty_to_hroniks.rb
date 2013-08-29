class AddCommnetsQtyToHroniks < ActiveRecord::Migration
  def change
    add_column :hroniks, :comments_qty, :integer, :default => 0
  end
end
