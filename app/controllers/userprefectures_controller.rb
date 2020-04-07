class UserprefecturesController < ApplicationController
    def index
        @userprefectures =  UserPrefecture.new
        @userprefectures.user_id = current_user.id
        @usertopics = Topic.find_by(user_id: params[:current_user.id])
        @userprefectures.prefecture = @usertopics.prefecture
    end
end
