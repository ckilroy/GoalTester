class GoalsController < ApplicationController

  def index
    @goals = Goal.all_public_goals + current_user.private_goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update(goal_params)
      if goal_params.include?(:completed)
        redirect_to user_url(@goal.user_id)
      else
        redirect_to goal_url(@goal)
      end
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy!
    redirect_to goals_url
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:text, :private, :completed)
  end

end
