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
		@current_genre = "모아보기"
  end

  def artists
  end

  def shows
    @shows = Show.all

    # @names는 장르의 중복값을 제거한 배열
    # 페이지가 로드될 때마다 되서 좀 그럼
    @names = Array.new
		@shows.each do |s|
			unless @names.include? s.genre
				@names << s.genre
			end
		end

    @current_genre = params[:g]
	end

end
