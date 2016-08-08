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
    @artist = Artist.all
  end

  def create

    if current_user.Artist.nil?
    artist = Artist.new(name: params[:name],
                        genre: params[:genre],
                        phone_number: params[:phone_number],
                        area: params[:area],
                        sns: params[:sns],
                        introduction: params[:introduction])

    artist.save
    redirect_to '/mypage'
    else
    #flash[:alert]: "you already have one"
    end


  end
 end
