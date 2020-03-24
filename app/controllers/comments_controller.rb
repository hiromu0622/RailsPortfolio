class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @topic = Topic.find_by(id: params[:topic_id])
    end

    def create
        @comment = Comment.new
        @comment.user_id = current_user.id
        @comment.topic_id = params[:comment][:topic_id]
        @comment.comment = params[:comment][:comment]
       if @comment.save
        redirect_to topics_new_path, success: 'コメントしました'
       else
        redirect_to topics_new_path, danger: 'コメントできませんでした'
       end

    end
end
