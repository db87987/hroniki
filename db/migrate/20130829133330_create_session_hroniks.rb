class CreateSessionHroniks < ActiveRecord::Migration
  def change
    create_table :session_hroniks do |t|
      t.integer :hronik_id
      t.string :session_id

      t.timestamps
    end
  end
end
