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
    
      # 配列の場合
        # @chart = [['行った県', @prefectures.count], ['行ってない県', 20]]
      # ハッシュの場合
        # @chart = {"国語" => 10, "算数" => 20, "理科"　=> 30, "社会" => 40}

    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @usertopics = Topic.where(user_id: params[:user_id])
      @prefectures = Topic.where(user_id: params[:user_id]).select(:prefecture).distinct
      # @= @prefectures.count
      @chart = [['行った県', @prefectures.count], ['行ってない県', 47-@prefectures.count]]
      # @userprefectures =  UserPrefecture.new
      # @userprefectures.user_id = params[:user_id]
    else
      @user = User.find(current_user.id)
      @usertopics = Topic.where(user_id: current_user.id)
      @prefectures = Topic.where(user_id: current_user.id).select(:prefecture).distinct
      # @userprefectures =  UserPrefecture.new
      # @userprefectures.user_id = current_user.id
      @chart = [['行った県', @prefectures.count], ['行ってない県', 47-@prefectures.count]]

    end
    # @userprefectures.prefecture = @usertopics.prefecture
  end

  def mypage_edit
    @user = User.find_by(id: current_user.id)
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
