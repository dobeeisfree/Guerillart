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

    # @names는 장르의 중복값을 제거한 배열
    @names = Array.new
    @shows.each do |s|
      unless @names.include? s.genre
        @names << s.genre
      end
    end

    @current_genre = params[:choose]
    # 디폴트로 모아보기
    if @current_genre.nil?
      @current_genre = "모아보기"
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
