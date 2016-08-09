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
  end
  
  def search
  end
  
  def artists
  end
  
  def shows
    @shows = Show.all.reverse
  end
end
