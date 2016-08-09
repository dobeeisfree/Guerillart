class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :content 
      t.string :genre
      t.integer :view_count
      t.integer :attend_count
      t.string :date
      t.datetime :start
      t.datetime :end
      t.text  :playlist
      t.string :location
      t.float :location_x
      t.float :location_y
      t.string :time

      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
