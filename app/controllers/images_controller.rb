class ImagesController < ApplicationController
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    @image.park_id = params[:park_id]
    if @image.save
      flash[:success] = "Image uploaded!"
      redirect_to request.referrer
    else
      @user = current_user
      initialize_show
      render 'users/show'
    end
  end

  def destroy
    @image.destroy
    flash[:success] = "Image deleted"
    redirect_to request.referrer || root_url
  end
  
  private

    def image_params
      params.fetch(:image, {}).permit(:image_file)
    end
    
    def correct_user
      @image = current_user.images.find_by(id: params[:id])
      redirect_to root_url if @image.nil?
    end
  
end
