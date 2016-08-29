class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :avatar, AvatarUploader
  mount_uploader :image, BannerImageUploader


  has_many :registers
  has_many :like_shows
  has_many :shows, through: :like_shows
  has_many :posts
  has_many :comments
  has_many :likes

  has_many :liked_shows, through: :likes, source: :show

  # 관계 이름 : follower_relations(다른 이름으로 변경 가능)
  # 외래키 : followed_id
  # 모델명 : Follow
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  # 관계 이름 : followers (다른 이름으로 변경 가능)
  # follow_relations를 통해 가져올 값 : follower ( follow.follower )
  has_many :followers, through: :follower_relations, source: :follower
  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relations, source: :followed


  has_many :creations, :class_name => Show , :foreign_key => :creator_id  #아티스트는 여러개의 공연을 등록할 수 있다.



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_like?(show)
    Like.find_by(user_id: self.id, show_id: show.id).present?
  end
end
