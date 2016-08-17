class SearchingController < ApplicationController
  def index
    @location = params[:location]
    @show_all = Show.all
    
  end
  
  def getBounds
    
    Show.index
    @search = Show.search do
      all_of do
        with(:location_x, params[:sw_lat].to_f..params[:ne_lat].to_f)
        with(:location_y, params[:sw_lng].to_f..params[:ne_lng].to_f)
      end
    end
    
    center_lat = params[:ct_lat].to_f
    center_lng = params[:ct_lng].to_f
    
    @dist = Array.new()


    # i = 0
    # @search.results.each do |x|
      # @resa.push({ id: x.id, dist: i })
      # i+=1
    # end
    
    puts Time.now

    @results = @search.results

    # @results.each do |res|
      # @dist.push(Math.sqrt((res.location_x-center_lat)**2+(res.location_y-center_lng)**2))
      # # puts res.genre 
    # end
#     
    # @dist.each do |x|
      # puts x
    # end
    
    
    render json: @results
    
    #render :json => {'results' => results}
    # redirect_to :back
    
  end
end
