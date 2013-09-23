class AddFieldsToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :date, :date
    add_attachment :issues, :image
  end
end
