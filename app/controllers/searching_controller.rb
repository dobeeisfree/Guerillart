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
        with(:status, 1) #진행중인 공연인지 확인
      end
    end

    center_lat = params[:ct_lat].to_f
    center_lng = params[:ct_lng].to_f

    isDistOrder = params[:isDistOrder]

    @results = @search.results
    
    #인기순 정렬이라면
    if isDistOrder.to_i == 0
      @results.sort! { |a, b| a.creator.fan_count <=> b.creator.fan_count }.reverse!
      
    #거리순 정렬이라면  
    else 
      @results.each do |res|
        res.dist = Math.sqrt((res.location_x-center_lat)**2+(res.location_y-center_lng)**2)
      end
      
      @results.sort! { |a, b| a.dist <=> b.dist }
    end

    render :json => @results.to_json(:include => :creator)
    
    # render :json => @results.to_json(:include => :creator { :only => :artist_name } )
    # respond_to do |format|
        # format.json  { render :json => @results.to_json(:include => :creator )}
      # end
    # render json: showArr
  end
  
  def select
    @choices = params[:a_search]

    if @choices == "0"
      @user = User.find_by_artist_name(params[:artist_name])
      redirect_to controller: 'artists', action: 'search', artist_name: params[:artist_name]
    elsif @choices == "1"
      redirect_to controller: 'searching', action: 'index', location: params[:artist_name]
    end
    
    
    
  end
end
