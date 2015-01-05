class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # Separated from users controller for external links
  def initialize_show
    @reviews = @user.reviews.paginate(page: params[:page])
    @images = @user.images.paginate(page: params[:page])
    @image = current_user.images.build if logged_in?
  end
  
    private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
end
