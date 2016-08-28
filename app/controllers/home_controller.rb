class HomeController < ApplicationController

  def index
    # unless user_signed_in?
      # redirect_to '/users/sign_in'
    # end

      #로그인 상태 확인 테스트 코드
    # if user_signed_in?
      # redirect_to '/users/sign_out'
    # end
    @shows = Show.all
  end

  def artists

   @artist_name = params[:artist_name]
   @users = User.find_by(artist_name: "@artist_name")

  end

  def shows
    @shows = Show.all
    @names = ["힙합/랩", "R&B/소울", "댄스", "일렉트로닉", "록", "재즈", "클래식", "팝"]

    # 분류를 위한 파람즈
    @current_genre = params[:choose]
    if @current_genre.nil?
      @current_genre = "모아보기" # 디폴트로 모아보기
    end

    # 시간에 따른 공연 분류
    @select_show = params[:select_show]
    if @select_show.nil?
      @select_show = "다가오는 공연" # 디폴트로 다가오는 공연
    end
	end

  def view
    @show = Show.find(params[:show_id])
  end

  def search
    @res_artists = User.find_by_artist_name(params[:artist_name])
  end

  def name
    @users = User.find_by_artist_name(params[:artist_name])
    @one_post = Post.find_by_user_id(@users.id)
    @posts = Post.all
    @followers = User.all
  end


end
