class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_verified
  helper_method :current_user

  def user_verified
    redirect_to '/' unless user_is_authenticated
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_is_authenticated
    !!current_user   #double bang operator returns boolean value
  end

end
