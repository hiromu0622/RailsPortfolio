class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def mypage
    @user = User.find_by(id: current_user.id)
  end
  
  def mypage_edit
    @user = User.new
  end
  def mypage_edit_update
    @user= User.find_by(id: current_user.id)
    # binding.pry
    if @user.update(user_edit_params)
    redirect_to users_mypage_path, success: '更新しました'
    else
      flash.now[:danger] = "更新に失敗しました"
      render :mypage_edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def user_edit_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :profile_photo)
  end
end
