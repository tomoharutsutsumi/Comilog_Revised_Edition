class ChangeStatusOfComics < ActiveRecord::Migration[5.1]
  def self.up
    change_column :comics, :status, :integer, default: 1, null: false, limit: 1
  end

  def self.down
    change_column :comics, :status, :integer, default: 0, null: false, limit: 1
  end
end
