class Show < ActiveRecord::Base
  searchable do
    float :location_x
    float :location_y
    integer :status
  end
  
  belongs_to :creator, :class_name => User  #공연 등록자에 종속
  
  has_many :like_shows
  has_many :users, through: :like_shows
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments

  def cnt_view(show)
    if show.view_count.nil?
      show.view_count = 0
    else
    	show.update_attribute "view_count", show.view_count = show.view_count + 1
      show.save
    end
  end

end
