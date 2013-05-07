class UserIdToIndexPolls < ActiveRecord::Migration
  def change
  	add_index :polls, :user_id
  end
end
