class Show < ActiveRecord::Base
  has_many :like_shows
  has_many :users, through: :like_shows
  belongs_to :artist
end
