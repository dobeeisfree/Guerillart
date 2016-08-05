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
      redirect_to "/dashboard/guerillart"
    else 
      flash[:alert] = "post.errors.values.flatten.join(' ')"
      redirect_to :back
    end
  end

  def edit
  end

  def edit_complete
  end

  def delete_complete
  end
end
