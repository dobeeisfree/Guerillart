class Show < ActiveRecord::Base
  has_many :like_shows
  has_many :users, through: :like_shows
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
