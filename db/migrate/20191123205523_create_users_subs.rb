class CreateUsersSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :users_subs do |t|
      t.belongs_to :user
      t.belongs_to :sub
    end
  end
end
