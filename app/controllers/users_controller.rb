class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:mypage]}
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
      @chart = [['行った県', @prefectures.count], ['行ってない県', 47-@prefectures.count]]

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

  def area
    @user = User.find(current_user.id)
    @prefectures = Topic.where(user_id: current_user.id).select(:prefecture).distinct
    prefecture = [
      # {'name' => 'Yamada', 'old' => 28},
      # {'name' => 'Yamada', 'old' => 28},
      # {'name' => 'Yamada', 'old' => 28},
      # {'name' => 'Yamada', 'old' => 28},
      {'code'=> 1, 'name' => "北海道", 'color'=> "#ff943c", 'hoverColor'=> "#ff943c", 'prefectures'=> [1]}
      # {code : 1, name: "北海道", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [1]},
      # {code : 2, name: "青森", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [2]},
      # {code : 3, name: "岩手", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [3]},
      # {code : 4, name: "宮城", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [4]},
      # {code : 5, name: "秋田", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [5]},
      # {code : 6, name: "山形", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [6]},
      # {code : 7, name: "福島", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [7]},
      # {code : 8, name: "茨城", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [8]},
      # {code : 9, name: "栃木", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [9]},
      # {code : 10, name: "群馬", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [10]},
      # {code : 11, name: "埼玉", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [11]},
      # {code : 12, name: "千葉", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [12]},
      # {code : 13, name: "東京", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [13]},
      # {code : 14, name: "神奈川", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [14]},
      # {code : 15, name: "新潟", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [15]},
      # {code : 16, name: "富山", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [16]},
      # {code : 17, name: "石川", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [17]},
      # {code : 18, name: "福井", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [18]},
      # {code : 19, name: "山梨", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [19]},
      # {code : 20, name: "長野", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [20]},
      # {code : 21, name: "岐阜", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [21]},
      # {code : 22, name: "静岡", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [22]},
      # {code : 23, name: "愛知", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [23]},
      # {code : 24, name: "三重", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [24]},
      # {code : 25, name: "滋賀", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [25]},
      # {code : 26, name: "京都", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [26]},
      # {code : 27, name: "大阪", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [27]},
      # {code : 28, name: "兵庫", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [28]},
      # {code : 29, name: "奈良", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [29]},
      # {code : 30, name: "和歌山", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [30]},
      # {code : 31, name: "鳥取", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [31]},
      # {code : 32, name: "島根", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [32]},
      # {code : 33, name: "岡山", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [33]},
      # {code : 34, name: "広島", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [34]},
      # {code : 35, name: "山口", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [35]},
      # {code : 36, name: "徳島", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [36]},
      # {code : 37, name: "香川", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [37]},
      # {code : 38, name: "愛媛", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [38]},
      # {code : 39, name: "高知", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [39]},
      # {code : 40, name: "福岡", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [40]},
      # {code : 41, name: "佐賀", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [41]},
      # {code : 42, name: "長崎", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [42]},
      # {code : 43, name: "熊本", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [43]},
      # {code : 44, name: "大分", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [44]},
      # {code : 45, name: "宮崎", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [45]},
      # {code : 46, name: "鹿児島", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [46]},
      # {code : 47, name: "沖縄", color: "#a0a0a0", hoverColor: "#ff943c", prefectures: [47]},
  ];

   render :json => prefecture

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
