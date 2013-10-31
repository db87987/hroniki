class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :from_visitor, :boolean, :default => false
    add_column :events, :moderated, :boolean, :default => false
    add_column :events, :author, :string
  end
end