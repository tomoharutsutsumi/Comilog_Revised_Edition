class AddComicIdAndUserIdToWants < ActiveRecord::Migration[5.1]
  def change
    add_column :wants, :comic_id, :integer
    add_column :wants, :user_id, :integer
  end
end
