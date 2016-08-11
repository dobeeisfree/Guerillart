class SearchingController < ApplicationController
  def index
    @location = params[:location]
    @show_all = Show.all
  end
  
  def getBounds
    # # @neLat = params[:ne_lat]
    # # @neLng = params[:ne_lng]
    # # @swLat = params[:sw_lat]
    # # @swLng = params[:sw_lng]
    # # puts @swLng.to_f
#     
    # # Show.reindex
    # @search = Show.search do
      # all_of do
        # # # with(:location_x, 37.514..130.0)
        # # # with(:location_y, 127.05362262676700..130.0)
        # with(:location_x, @swLat.to_f..@neLat.to_f)
        # with(:location_y, @swLng.to_f..@neLng.to_f)
      # end
    # end
    # # @results = @search.results
    # redirect_to :back
    
    
    # @neLat = params[:ne_lat].to_s.to_f
    # puts @neLat
    
    
    Show.index
    @search = Show.search do
      all_of do
        with(:location_x, params[:sw_lat].to_s.to_f..params[:ne_lat].to_s.to_f)
        with(:location_y, params[:sw_lng].to_s.to_f..params[:ne_lng].to_s.to_f)
      end
    end
    @results = @search.results
    puts Time.now
    @results.each do |x|
      puts x.genre 
    end
    
    redirect_to :back
    
  end
end
