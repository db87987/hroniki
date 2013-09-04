class ChangeCommentsQtyToHroniks < ActiveRecord::Migration
  def up
      remove_column :hroniks, :comments_qty
      add_column :hroniks, :comments_qty, :integer, :null => false, :default => 0
  end

  def down
      remove_column :hroniks, :comments_qty
      add_column :hroniks, :comments_qty, :integer, :default => 0
  end
end
