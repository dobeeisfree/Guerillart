class ArtistsController < ApplicationController
  before_action :authenticate_user!, :only => [ :new, :create, :edit, :update ]
  # before_action :isSignin, :only => [ :new, :create, :edit, :update ]

  # def isSignIn
    # unless user_signed_in?
      # redirect_to '/'
    # end
  # end


  def index
    @user = User.all
  end

  def new
    if current_user.artist_name.present?
      redirect_to '/dashboard/home'
    end
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

  def edit
   a = params[:artist_name]
   if a != current_user.artist_name
      redirect_to "/artists"
   end

   @users = User.find_by(artist_name: a)
   @posts = Post.all
  end

  def update
    @users = User.find(params[:user_id])
    if @users.id != current_user.id
      redirect_to "/artists"
    end

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

  def page
    @users = User.find_by_artist_name(params[:artist_name])
    @one_post = Post.find_by_user_id(@users)
    @posts = Post.all
    @followers = User.all
    @follow = Follow.all
  end

  def search
    @user = User.find_by(artist_name: params[:artist_name])
  end
end
