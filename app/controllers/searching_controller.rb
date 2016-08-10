class SearchingController < ApplicationController
  def index
    @location = params[:location]
    @show_all = Show.all
    
  end
  
  def getBounds
    @neLat = params[:ne_lat]
    @neLng = params[:ne_lng]
    @swLat = params[:sw_lat]
    @swLng = params[:sw_lng]
    puts @swLng.to_f
    
    # Show.reindex
    @search = Show.search do
      all_of do
        # # with(:location_x, 37.514..130.0)
        # # with(:location_y, 127.05362262676700..130.0)
        with(:location_x, @swLat.to_f..@neLat.to_f)
        with(:location_y, @swLng.to_f..@neLng.to_f)
      end
    end
    # @results = @search.results
    redirect_to :back
  end
end
