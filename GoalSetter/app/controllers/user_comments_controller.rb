class UserCommentsController < ApplicationController


  def new
    @user_comment = UserComment.new
  end


  def create
    @user_comment = current_user.authored_user_comments.new(user_comment_params)

    if @user_comment.save
      redirect_to user_url(@user_comment.user_id)
    else
      flash[:errors] = @user_comment.errors.full_messages
      redirect_to user_url(@user_comment.user_id)
    end
  end

  def destroy
    @user_comment = UserComment.find(params[:id])
    @user_comment.destroy!
    redirect_to user_url(@user_comment.user_id)
  end

  private

  def user_comment_params
    params.require(:user_comment).permit(:body, :user_id)
  end

end
