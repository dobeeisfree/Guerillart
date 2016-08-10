class HomeController < ApplicationController
  def index
    # unless user_signed_in?
      # redirect_to '/users/sign_in'
    # end
    
      #로그인 상태 확인 테스트 코드
    # if user_signed_in?
      # redirect_to '/users/sign_out'
    # end
    @shows = Show.all.reverse
		@current_genre = "모아보기"
  end
  
  def artists
  end
  
  def shows
    @shows = Show.all.reverse
		
		# 장르값의 중복을 없앤다.
		@names = Array.new
		@shows.each do |s|
			unless @names.include? s.genre
				@names << s.genre
			end
		end
		
		@current_genre = params[:g]
	end
	
end
