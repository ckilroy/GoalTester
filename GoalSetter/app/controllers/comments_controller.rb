class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.authored_comments.new(comment_params)

    if @comment.save
      redirect_to @comment.commentable
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to @comment.commentable
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to @comment.commentable
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

end
