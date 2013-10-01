class AddSnToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :sn, :integer, :default => 0  
    Feedback.all.each do |feedback|
      feedback.sn = 0
      feedback.save!
    end
  end
end
