class CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.content = params[:content]
    comment.show_id = params[:show_id]
    comment.user_id = current_user.id

    comment.save
    redirect_to :back
                              
  end

  def destroy
  end
end
