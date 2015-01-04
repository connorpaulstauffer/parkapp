class ImagesController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:success] = "Image uploaded!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  private

    def image_params
      params.require(:image).permit(:image_file)
    end
    
    def correct_user
      @image = current_user.images.find_by(id: params[:id])
      redirect_to root_url if @image.nil?
    end
  
end
