class AddFieldsToHroniks < ActiveRecord::Migration
  def change
    add_column :hroniks, :from_visitor, :boolean, :default => false
    add_column :hroniks, :moderated, :boolean, :default => false
    
    Hronik.all.each do |hronik|
      hronik.from_visitor = false
      hronik.moderated = false
      hronik.save!
    end
  end
end
