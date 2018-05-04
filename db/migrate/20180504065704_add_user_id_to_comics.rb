class AddUserIdToComics < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :user_id, :integer
  end
end
