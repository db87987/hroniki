class AddIndexesToSessionHroniks < ActiveRecord::Migration
  def change
    add_index :session_hroniks, [:hronik_id, :session_id], unique: true
    add_index :session_hroniks, :hronik_id
  end
end
