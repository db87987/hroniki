class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :quiz_id
      t.integer :rate, :default => 0

      t.timestamps
    end
  end
end
