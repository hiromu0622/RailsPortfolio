class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  helper_method :current_user, :logged_in?, :prefecture_clear

  def current_user
    return @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def authenticate_user
    if current_user.blank?
      redirect_to new_user_path, success: 'ユーザー登録して全ての機能を使いこなそう！！'
    end
  end

  def prefecture_clear
    @prefectures = Topic.where(user_id: current_user.id).select(:prefecture).distinct
  end
end
