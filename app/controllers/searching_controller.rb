class SearchingController < ApplicationController
  
  def index
    @location = params[:location]
    @show_all = Show.all  #쓸모 없음
    
  end
  
  def getBounds
    
    Show.index
    @search = Show.search do
      all_of do
        with(:location_x, params[:sw_lat].to_f..params[:ne_lat].to_f)
        with(:location_y, params[:sw_lng].to_f..params[:ne_lng].to_f)
        with(:status).equal_to(1) #진행중
      end
    end
    
    center_lat = params[:ct_lat].to_f
    center_lng = params[:ct_lng].to_f
    
    

    # i = 0
    # @search.results.each do |x|
      # @resa.push({ id: x.id, dist: i })
      # i+=1
    # end
    
    puts Time.now

    @results = @search.results

    addedDist = []
    @results.each do |res|
      addedDist.push({"show"=>res, "dist"=>Math.sqrt((res.location_x-center_lat)**2+(res.location_y-center_lng)**2)})
    end
  
    addedDist.each do |x|
      puts x
    end
    
    puts ""
    puts Time.now
    addedDist.sort! { |a, b| a["dist"] <=> b["dist"]}
    puts Time.now
    
    addedDist.each do |x|
      puts x["dist"]
    end
    
    # render json: @results
    render json: addedDist
    
    #render :json => {'results' => results}
    # redirect_to :back
    
  end
end
