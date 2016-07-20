class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.integer :phone_number
      t.string :area
      t.string :sns
      t.text :introduction
      t.string :fan
      t.integer :fan_count

      t.timestamps null: false
    end
  end
end
