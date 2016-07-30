class SearchingController < ApplicationController
  def index
    @location = params[:location]
    
  end
end
