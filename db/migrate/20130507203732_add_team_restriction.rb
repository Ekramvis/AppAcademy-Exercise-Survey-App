class AddTeamRestriction < ActiveRecord::Migration
  def change
    add_column :polls, :team_restriction, :integer
  end
end
