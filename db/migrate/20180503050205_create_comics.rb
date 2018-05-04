class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :front_cover
      t.integer :price
      t.string :sns_first
      t.string :sns_second
      t.string :sns_third
      t.string :sns_fourth
      t.string :sns_fifth
      t.text :introduction
      t.string :content_first
      t.string :content_second
      t.string :content_third
      t.string :content_fourth
      t.string :content_fifth
      t.string :type
      t.integer :day
      t.string :origin_title
      t.integer :agetarget

      t.timestamps
    end
  end
end
