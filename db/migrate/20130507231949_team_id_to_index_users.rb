class TeamIdToIndexUsers < ActiveRecord::Migration
  def change
  	add_index :users, :team_id
  end
end
