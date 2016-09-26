class PostsController < ApplicationController

  def create
    @post = Post.new
    @post.content = params[:content]
    @post.user_id = current_user.id

    if  @post.save
    redirect_to :back
    else
    redirect_to :back
    end
  end

  def update 
    @post = Post.find(params[:id])
  end
  
  def edit
  end

  def destroy
  end

end
