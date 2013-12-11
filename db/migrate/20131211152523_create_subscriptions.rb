class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :birth
      t.string :profession
      t.string :index
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end
