class ParksController < ApplicationController
  
  def index
    @parks = Park.paginate(page: params[:page])
  end
  
  def show
    @park = Park.find(params[:id])
    @image = current_user.images.build(park_id: params[:id]) if logged_in?
    @images = @park.images.paginate(page: params[:page])
  end
  
end
