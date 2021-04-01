class CommentsController < ApplicationController
  before_action :update_time_out, only: %i[ edit update ] 

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id

    @comment.save

    if @comment
      flash[:success] = "Your comment was successfully created."
    else
      flash.now[:error] = "There was an issue with your comment."
    end 

    redirect_to post_path(@comment.post)
  end 

  def comment_params
    params.require(:comment).permit(:user_id, :comment)
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.update(comment_params)
      flash[:success] = "Your comment was successfully updated."
      redirect_to post_path(@post)
    else
      flash.now[:error] = "There was an issue with your comment."
      render 'edit'
    end
  end

  def edit 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy


   if Comment.exists?(params[:id])
    flash.now[:error] = "There was an issue with your comment."
    else
      
      flash[:success] = "Your comment was successfully deleted."
    end

    redirect_to post_path(@post)
  end

  def check_update_timeout?
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    update_timeout = @comment.created_at + 10.minutes
    Time.now > update_timeout
  end 

  def update_time_out
    if check_update_timeout?
      flash[:error] = "This comment is now locked."
      redirect_to post_path(@post)
    end
  end

end
