class Artist < ActiveRecord::Base
  has_many :registers
  has_many :users, through: :registers
  has_many :shows
  has_many :posts
  has_many :comments
end
