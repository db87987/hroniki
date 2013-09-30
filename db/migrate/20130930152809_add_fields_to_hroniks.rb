class AddFieldsToHroniks < ActiveRecord::Migration
  def change
    add_column :hroniks, :from_visitor, :boolean
    add_column :hroniks, :moderated, :boolean
  end
end
