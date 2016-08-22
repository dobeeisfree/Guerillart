class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.content = params[:content]
    comment.show_id = params[:show_id]
    comment.post_id = params[:post_id]
    comment.user_id = current_user.id

    comment.save
    
    @user = User.find_by(id: comment.user_id)
    @cmt = Comment.find_by(user_id: current_user.id)
    array = []
    array.push("cmt"=>@cmt, "user"=>@user)  
  render json: array 
  end

  def destroy
  end
end

