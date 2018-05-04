class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :circlename, :string
    add_column :users, :authorname, :string
    add_column :users, :username, :string
    add_column :users, :image, :string
    add_column :users, :nickname, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
