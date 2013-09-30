class AddAuthorToHroniks < ActiveRecord::Migration
  def change
    add_column :hroniks, :author, :string
  end
end
