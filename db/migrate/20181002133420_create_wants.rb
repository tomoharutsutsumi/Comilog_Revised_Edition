class CreateWants < ActiveRecord::Migration[5.1]
  def change
    create_table :wants do |t|

      t.timestamps
    end
  end
end
