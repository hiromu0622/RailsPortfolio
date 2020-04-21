class CommentsController < ApplicationController
    def new
        @comment = Comment.new
        @topic = Topic.find_by(id: params[:topic_id])
    end

    def create
        # ページ遷移してコメントするバージョン
        # @comment = Comment.new
        # @comment.user_id = current_user.id
        # @comment.topic_id = params[:comment][:topic_id]
        # @comment.comment = params[:comment][:comment]
        # if @comment.save
            # redirect_to topics_path, success: 'コメントしました'
        # else
            # redirect_to topics_path, danger: 'コメントできませんでした'
        # end

        # ajax でコメントバージョン
        @topic = Topic.find_by(id: params[:topic_id])
        @comment = @topic.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            render :index
        end


    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        if @comment.destroy
           render :index
            # redirect_to topics_path, success: 'コメントを削除しました'
        end
    end

private
    def comment_params
        params.require(:comment).permit(:comment, :topic_id, :user_id)
    end

end
