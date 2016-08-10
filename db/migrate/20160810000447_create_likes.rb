class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user
      t.belongs_to :show

      t.timestamps null: false
    end
  end
end
