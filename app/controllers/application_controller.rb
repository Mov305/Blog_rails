class ApplicationController < ActionController::Base

  # make a current_user method available to all controllers
  def current_user
    User.first
  end
end
