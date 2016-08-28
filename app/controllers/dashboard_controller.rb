class DashboardController < ApplicationController
#보안  before_action :check_ownership, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def home
  end

  def guerillart
    @shows = Show.all
  end

  def profile
  end

  def write
  end

  def write_complete
    show = Show.new
    show.title = params[:show_title]
    show.time = params[:time]
    show.content = params[:show_content]
    show.genre = params[:genre]
    show.location = params[:location]
    show.playlist = params[:playlist]
    show.creator_id = current_user.id
    if show.save
      flash[:alert] = "저장되었습니다"
      redirect_to "/dashboard/guerillart"
    else
      flash[:alert] = "post.errors.values.flatten.join(' ')"
      redirect_to :back
    end
  end

  def edit
    @one_show = Show.find(params[:show_id])
  end

  def edit_complete
    @one_show = Show.find(params[:show_id])
    @one_show.title = params[:show_title]
    @one_show.time = params[:time]
    @one_show.content = params[:show_content]
    @one_show.genre = params[:genre]
    @one_show.location = params[:location]
    @one_show.playlist = params[:playlist]
    if @one_show.save
      flash[:alert] = "저장되었습니다"
      redirect_to "/dashboard/guerillart"
    else
      flash[:alert] = "post.errors.values.flatten.join(' ')"
      redirect_to :back
    end
  end

  def delete_complete
    @one_show = Show.find(params[:show_id])
    @one_show.destroy
    redirect_to "/dashboard/guerillart"
    flash[:alert] = "삭제되었습니다."
  end

  def mypage
   a = params[:artist_name]
   @users = User.find_by(artist_name: a )
   @one_post = Post.find_by(user_id: @users.id)
   @posts = Post.all
  end

  def create

    if current_user.artist_name.nil?

      current_user.artist_name = params[:name]
      current_user.genre = params[:genre]
      current_user.phone_number = params[:phone_number]
      current_user.area = params[:area]
      current_user.sns = params[:sns]
      current_user.introduction = params[:introduction]
      current_user.save
      redirect_to '/dashboard/home'
    else
      flash[:alert]= "you already have one"
      redirect_to '/dashboard/home'
    end
  end

  def create_artist
  end

  def write_post
    @post = Post.new
    @post.content = params[:content]
    @post.user_id = current_user.id

    if  @post.save
    redirect_to :back
    else
    redirect_to :back
    end
  end

  def edit_post
    @post = Post.find(params[:id])
  end

  def mypage_edit
   a = params[:artist_name]
   @users = User.find_by(artist_name: a )
   @posts = Post.all
  end

  def mypage_edit_complete
    @users = User.find(params[:user_id])
    @users.introduction = params[:introduction]
    @users.sns = params[:sns]
    @users.image = params[:image]
    @users.avatar = params[:avatar]

    if @users.save
    redirect_to :back
    else
    redirect_to :back
    end
  end
=begin
  private

  def check_ownership
      @one_show = Show.find_by(id: params[:id])
      redirect_to root_path if @one_show.user.id != current_user.id
  end
=end

end
