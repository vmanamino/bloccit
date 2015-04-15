class AddUserToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :user_id, :integer
    add_index :summaries, :user_id
  end
end
   