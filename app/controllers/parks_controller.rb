class ParksController < ApplicationController
  
  def index
    @parks = Park.paginate(page: params[:page])
  end
  
  def show
    @park = Park.find(params[:id])
  end
  
end
