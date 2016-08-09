class DashboardController < ApplicationController
  def home
  end

  def guerillart
    @shows = Show.all
  end

  def profle
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
    if show.save
      flash[:alert] = "저장되었습니다"
      redirect_to "/guerillart"
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
      redirect_to "/guerillart"
    else
      flash[:alert] = "post.errors.values.flatten.join(' ')"
      redirect_to :back
    end
  end

  def delete_complete
    @one_show = Show.find(params[:show_id])
    @one_show.destroy
    redirect_to "/guerillart"
    flash[:alert] = "삭제되었습니다."
  end

  def mypage
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
      redirect_to '/mypage'
    else
      flash[:alert]= "you already have one"
    end
  end
 end
