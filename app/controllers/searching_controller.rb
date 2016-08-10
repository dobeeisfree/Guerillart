class SearchingController < ApplicationController
  def index
    @location = params[:location]
    @show_all = Show.all
    
  end
end
