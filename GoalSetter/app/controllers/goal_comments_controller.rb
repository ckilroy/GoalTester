class GoalCommentsController < ApplicationController

  def new
    @goal_comment = GoalComment.new
  end


  def create
    @goal_comment = current_user.authored_goal_comments.new(goal_comment_params)

    if @goal_comment.save
      redirect_to goal_url(@goal_comment.goal_id)
    else
      flash[:errors] = @goal_comment.errors.full_messages
      redirect_to goal_url(@goal_comment.goal_id)
    end
  end

  def destroy
    @goal_comment = GoalComment.find(params[:id])
    @goal_comment.destroy!
    redirect_to goal_url(@goal_comment.goal_id)
  end

  private

  def goal_comment_params
    params.require(:goal_comment).permit(:body, :goal_id)
  end

end
