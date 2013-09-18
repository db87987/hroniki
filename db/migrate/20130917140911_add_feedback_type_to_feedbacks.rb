class AddFeedbackTypeToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :feedback_type, :string
    remove_column :feedbacks, :type
  end
end
