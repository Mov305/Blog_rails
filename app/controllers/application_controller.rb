class ApplicationController < ActionController::Base
  # make a current_user method available to all controllers
  protect_from_forgery prepend: true # protect from CSRF attacks
  before_action :update_allowed_parameters, if: :devise_controller? # allow name and bio to be updated
  before_action :authenticate_user! # require user to be logged in to access any page

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :bio, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :bio, :email, :password, :current_password)
    end
  end
end
