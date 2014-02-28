class AddCanDisplayToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :can_display, :boolean, default: true
  end
end
