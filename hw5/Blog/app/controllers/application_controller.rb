class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signed_in?
      if cookies[:auth_token].present? && current_user.nil?
      cookies[:auth_token] = nil
      end
      cookies[:auth_token].present?
    end
  helper_method :user_signed_in?


  def current_user
    # @current_user ||= User.find_by(id: session[:user_id])
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_session_path, alert: 'You must sign in or sign up first!'
    end
  end
  # go to posts controller, let non-signed in users can only view posts


end
