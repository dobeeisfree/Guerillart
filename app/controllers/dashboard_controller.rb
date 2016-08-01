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
    show = Show.all
    show.title = params[:show_title]
    show.content = params[:show_content]
    show.genre = params[:genre]
    show.date = params[:date]
    show.playlist = params[:playlist]
  end

  def edit
  end

  def edit_complete
  end

  def delete_complete
  end
end
