class RenamePollTeamId < ActiveRecord::Migration
  def change
    rename_column :polls, :team_restriction, :team_id
  end
end
