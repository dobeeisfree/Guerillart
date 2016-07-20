class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  has_many :comments
end
