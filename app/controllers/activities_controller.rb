# rubocop:disable all

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

  def targets
    user = User.find_by(id: params[:id])
    today_target = user.activities.where("DATE(created_at) = ?", Date.today)
    yesterday_target = user.activities.where("DATE(created_at) = ?", Date.today - 1)
    last_week_1_target = user.activities.where("DATE(created_at) < ?", 5.days.ago)
    last_week_2_target = user.activities.where("DATE(created_at) < ?", 4.days.ago)
    sum_of_today_targets = 0.0
    sum_of_yesterday_targets = 0.0
    sum_of_last_week_1_targets = 0.0
    sum_of_last_week_2_targets = 0.0
    today_target.each do |t|
      sum_of_today_targets += t.target.to_d
    end
    yesterday_target.each do |t|
      sum_of_yesterday_targets += t.target.to_d
    end
    last_week_1_target.each do |t|
      sum_of_last_week_1_targets += t.target.to_d
    end
    last_week_2_target.each do |t|
      sum_of_last_week_2_targets += t.target.to_d
    end
    render json: { today_target: sum_of_today_targets, yesterday_target: sum_of_yesterday_targets,
                   last_week_1_target: sum_of_last_week_1_targets, last_week_2_target: sum_of_last_week_2_targets }
  end

  private

  def activity_params
    params.permit(:target, :id, :user_id)
  end
end
