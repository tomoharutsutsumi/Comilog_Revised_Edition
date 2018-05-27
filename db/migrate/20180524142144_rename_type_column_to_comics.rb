class RenameTypeColumnToComics < ActiveRecord::Migration[5.1]
  def change
    rename_column :comics, :type, :category
  end
end
