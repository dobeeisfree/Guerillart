class ShowsController < ApplicationController
  before_action :authenticate_user!, :only => [ :new, :create, :edit, :update, :destroy ]

  def index
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


  def new
  end

  def create
    show = Show.new
    show.title = params[:show_title]
    show.start = params[:time].to_time
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

    if @one_show.creator_id != current_user.id
      redirect_to "/shows"
    end
  end


  def update
    @one_show = Show.find(params[:show_id])

    if @one_show.creator_id != current_user.id
      redirect_to "/shows"
    end

    @one_show.title = params[:show_title]
    @one_show.start = params[:time].to_time
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

  def destroy
    #저장된 이미지 파일등도 삭제해야 함
    @one_show = Show.find(params[:show_id])
    if @one_show.creator_id != current_user.id
      redirect_to "/shows"
    end

    @one_show.destroy
    redirect_to "/dashboard/guerillart"
    flash[:alert] = "삭제되었습니다."
  end

  def show
    @show = Show.find(params[:id])
  end

  def starting
    @id = params[:show_id].to_i
    # puts "starting id : " + @id.to_s

    if(@id == 0)

    elsif @id > 0
      @st_show = Show.find_by(id: @id)

      render :json => @st_show.to_json
    end

  end

  def start
    #if 즉석공연이라면
    @show = Show.new
    @show.title = current_user.artist_name + "님의 즉석 공연"
    @show.start = params[:time].to_time
    @show.genre = current_user.genre
    @show.location = params[:location]
    @show.creator_id = current_user.id
    @show.status = 1

    #else 등록된 공연이라면
    @show = Show.find(params[:show_id])
    @show.start = Time.now
    @show.location_x = params[:loc_x]
    @show.location_y = params[:loc_y]
    @show.location = params[:location]
    @show.status = 1
    #end

    if @show.save
      flash[:alert] = "공연을 시작하였습니다."
      redirect_to :back
    else
      flash[:alert] = "post.errors.values.flatten.join(' ')"
      redirect_to :back
    end

  end

  def finish
    @show = Show.find(params[:show_id])
    @show.status = 2

    if @show.save
      flash[:alert] = "공연을 종료하였습니다."
      redirect_to :back
    else
      flash[:alert] = "post.errors.values.flatten.join(' ')"
      redirect_to :back
    end

  end


end
