class AddFetchingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fetching, :boolean
  end
end
