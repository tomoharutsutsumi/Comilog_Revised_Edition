class AddLikesCountToComics < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :likes_count, :integer, :default => 0
  end
end
