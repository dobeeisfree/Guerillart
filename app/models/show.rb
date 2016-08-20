class Show < ActiveRecord::Base
  searchable do
    float :location_x
    float :location_y
    integer :status
  end
  
  has_many :like_shows
  has_many :users, through: :like_shows
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
end
