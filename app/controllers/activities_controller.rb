class ActivitiesController < ApplicationController
  def create
    @activity = Activity.create!(activity_params)
    if @activity.valid?
      render json: @activity
    else
      render json: { errors: @activity.errors.full_messages }
    end
  end

  def show
    @activity = Activity.find(params[:id])
    render json: @activity
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)
    if @activity.valid?
      render json: @activity
    else
      render json: { errors: @activity.errors.full_messages }
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    head :no_content
  end

  def today_targets
    user = User.find_by(id: params[:id])
    target = user.activities.where("DATE(created_at) = ?", Date.today)
    sum = 0.0
    target.each do |t|
      sum += t.target.to_d
    end
    render json: { sum: sum }
  end

  private

  def activity_params
    params.permit(:target, :id, :user_id)
  end
end
