class ParksController < ApplicationController
  
  def index
    @parks = Park.all
    @images = Image.paginate(page: params[:page])
    
    @geojson = Array.new
    
    @parks.each do |park|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [park.longitude, park.latitude]
        },
        properties: {
          name: park.name,
          state: park.state,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
    
    respond_to do |format|
    format.html
    format.json { render json: @geojson }  # respond with the created JSON object
end
  end
  
  def show
    @park = Park.find(params[:id])
    @image = current_user.images.build(park_id: params[:id]) if logged_in?
    @images = @park.images.paginate(page: params[:page])
  end
  
end
