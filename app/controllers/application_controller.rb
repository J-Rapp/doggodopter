class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_login
    return unless session[:user_id].nil?
    flash[:error] = 'You must be logged in to access that section'
    redirect_to root_path
  end
end
