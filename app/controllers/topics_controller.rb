class TopicsController < ApplicationController
before_action :authenticate_user,{only:[:detail]}

  def index
    @topics = Topic.all.includes(:favorite_users).order(created_at: :desc)
    # @comments = @topics.comment.order(created_at: :desc)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end
  def destroy
    @topic = Topic.find_by(id: params[:id])
    @topic.destroy
    redirect_to topics_path, danger: 'トピックを削除しました'
  end

  def usertopics
    @topics = Topic.where(user_id: current_user).all.order(created_at: :desc)
  end

  def detail
    @topic = Topic.find_by(id: params[:topic_id])
    # @topic = Topic.find(params[:id])
    @comment = Comment.new
    @comments = @topic.comments
  end

  def edit
    @topic = Topic.find_by(id: params[:topic_id])
  end
  def update
    @topic = Topic.find_by(id: params[:id])
    # binding.pry
    if @topic.update(topic_params)
      redirect_to topics_path, success: '更新しました'
    else
      flash.now[:danger] = "更新に失敗しました"
      render :topic_edit
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @comment = Comment.new
    @comments = @topic.comments
  end

  def prefecture
    @topic = Topic.find_by(prefecture: params[:prefecture])
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description, :prefecture, :title)
  end
end
