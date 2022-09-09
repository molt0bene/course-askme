class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :author_by_id
  helper_method :user_logged_in
  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_with_alert
    redirect_to root_path, alert: 'Вам сюда нельзя!'
  end

  def author_by_id(id)
    user ||= User.find(id)
  end

  def user_logged_in
    current_user
  end
end
