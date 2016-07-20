class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  belongs_to :show
  belongs_to :post
end
