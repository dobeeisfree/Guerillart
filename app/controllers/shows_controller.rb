class ShowsController < ApplicationController
  before_action :authenticate_user!, :only => [ :new, :create, :edit, :update, :destroy ]

  def index
    @shows = Show.paginate(:page => params[:page])
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


  def new
    @names = ["힙합/랩", "R&B/소울", "댄스", "일렉트로닉", "록", "재즈", "클래식", "팝"]
  end

  def create
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
      redirect_to "/dashboard/manage"
    else
      flash[:alert] = "post.errors.values.flatten.join(' ')"
      redirect_to :back
    end
  end


  def edit
    @one_show = Show.find(params[:id])
    @names = ["힙합/랩", "R&B/소울", "댄스", "일렉트로닉", "록", "재즈", "클래식", "팝"]

    if @one_show.creator_id != current_user.id
      redirect_to "/shows"
    end
  end


  def update
    @show = Show.find(params[:id])

    if @show.creator_id != current_user.id
      redirect_to "/shows"
    end

    if @show.update_attributes(show_param)
      flash[:alert] = "저장되었습니다"
      redirect_to "/dashboard/manage"
    else
      flash[:alert] = "post.errors.values.flatten.join(' ')"
      redirect_to :back
    end
  end

  # 아래의 파람즈 목록만 허용한다.
  def show_param
    params.require(:show).permit(:title, :time, :playlist, :location, :content, :genre)
  end

  def destroy
    #저장된 이미지 파일등도 삭제해야 함
    @one_show = Show.find(params[:id])
    if @one_show.creator_id != current_user.id
      redirect_to "/shows"
    end

    @one_show.destroy
    flash[:alert] = "삭제되었습니다."
    redirect_to "/dashboard/manage"
  end

  def show
    @show = Show.find(params[:id])
  end

end
