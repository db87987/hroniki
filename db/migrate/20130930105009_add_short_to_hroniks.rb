class AddShortToHroniks < ActiveRecord::Migration
  def change
    add_column :hroniks, :short, :text
  end
end
