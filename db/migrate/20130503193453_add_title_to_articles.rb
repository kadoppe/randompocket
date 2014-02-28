class AddTitleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :title, :text
  end
end
