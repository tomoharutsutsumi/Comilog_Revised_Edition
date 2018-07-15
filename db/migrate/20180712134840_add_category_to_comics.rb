class AddCategoryToComics < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :category, :integer
  end
end
