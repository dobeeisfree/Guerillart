class DashboardController < ApplicationController
#보안  before_action :check_ownership, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def home 
  end

  def guerillart
    @shows = Show.all
    # 메뉴 분류를 위한 변수
    @yourlikes = Like.where(user_id: current_user.id)
    @menu = params[:menu]
    @followed = Follow.where(follower_id: current_user.id)
  end

  def profile
  end

end
