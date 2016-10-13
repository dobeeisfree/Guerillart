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

  def starting

    if current_user.playing_id == 0
      @id = params[:show_id].to_i
      # puts "starting id : " + @id.to_s


      if(@id == 0) #즉석 공연
        @st_show = ""
      elsif @id > 0 #예정 공연
        @st_show = Show.find_by(id: @id)
      end
      render :json => @st_show.to_json

    else
      flash[:alert] = "이미 진행중인 공연이 존재합니다."
    end

  end #starting

  def start
    puts "start!"
    if current_user.playing_id == 0

      @show = 0
      if params[:show_id].to_i == 0
        puts "영이라면"
        @show = Show.new
        @show.title = current_user.artist_name + "님의 즉석 공연"
        @show.genre = current_user.genre
        @show.creator_id = current_user.id
      else
        puts "아니라면"
        @show = Show.find_by(id: params[:show_id])
      end

      @show.start = Time.now
      @show.location_x = params[:loc_x].to_f
      @show.location_y = params[:loc_y].to_f
      @show.location = params[:location]
      @show.status = 1

      if @show.save
        flash[:alert] = "공연을 시작하였습니다."
        puts "플레잉 아이디는 " + @show.id.to_s
        current_user.playing_id = @show.id
        current_user.save
        render :json => @show.to_json
        # redirect_to :back
      else
        flash[:alert] = "post.errors.values.flatten.join(' ')"
        # redirect_to :back
      end

    else
      flash[:alert] = "이미 진행중인 공연이 존재합니다."
    end

  end #start

  # def finishing
  #
  #   if current_user.playing_id != 0
  #
  #     @fin_id = params[:show_id].to_i
  #
  #     if(@id == 0)
  #
  #     elsif @id > 0
  #       @fin_show = Show.find_by(id: @fin_id)
  #
  #       render :json => @fin_show.to_json
  #     end
  #
  #
  #
  #   else
  #     flash[:alert] = "현재 진행중인 공연이 없습니다."
  #   end
  #
  # end

  def finish
    if current_user.playing_id > 0

      @fin_show = Show.find_by(id: current_user.playing_id)
      @fin_show.status = 2

      if @fin_show.save
        flash[:alert] = "공연을 종료하였습니다."
        current_user.playing_id = 0
        current_user.save
        render :json => @show.to_json
      else
        flash[:alert] = "post.errors.values.flatten.join(' ')"
        render :json => @show.to_json
      end

    elsif current_user.playing_id == 0
      flash[:alert] = "현재 진행중인 공연이 없습니다."
    end

  end #finish


end
