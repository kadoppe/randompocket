class AddReadToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :read, :boolean, default: false
    add_index :articles, [:user_id, :read]
  end
end
