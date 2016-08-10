class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :registers
  has_many :like_shows
  has_many :shows, through: :like_shows
  has_many :posts
  has_many :comments
  has_many :likes

  has_many :liked_shows, through: :likes, source: :show

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_like?(show)
    Like.find_by(user_id: self.id, show_id: show.id).present?
  end

end
