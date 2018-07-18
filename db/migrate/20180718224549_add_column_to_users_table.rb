class AddColumnToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :residence, :string
    add_column :users, :professional, :boolean
    add_column :users, :fitness_level, :string
  end
end
