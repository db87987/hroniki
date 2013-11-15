class AddGuestToEvents < ActiveRecord::Migration
  def change
    add_column :events, :guest, :boolean, :default => false
  end
end
