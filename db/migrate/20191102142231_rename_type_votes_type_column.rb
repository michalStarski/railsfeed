class RenameTypeVotesTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :votes, :type, :reaction
  end
end
