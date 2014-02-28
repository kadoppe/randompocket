class AddItemIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :item_id, :integer
    add_index :articles, :item_id
    add_index :articles, [:user_id, :item_id]
  end
end
