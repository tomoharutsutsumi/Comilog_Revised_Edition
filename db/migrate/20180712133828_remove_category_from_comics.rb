class RemoveCategoryFromComics < ActiveRecord::Migration[5.1]
  def change
    remove_column :comics, :category, :string
  end
end
