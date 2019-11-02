class AddTypeFieldForVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :type, :string
  end
end
