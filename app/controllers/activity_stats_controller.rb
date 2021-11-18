# rubocop:disable all

class ActivityStatsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    @stat = user.activity_stats.create!(stat_params)
    render json: { errors: @stat.errors.full_messages } unless @stat.valid?
  end

  def update
    @stat = ActivityStat.find(params[:id])
    @stat.update(stat_params)
    if @stat.valid?
      @calories = ActivityStat.calories_burned(@stat).round(2)
      render json: { calories: @calories }
    else
      render json: { errors: @stat.errors.full_messages }
    end
  end

  def destroy
    @stat = ActivityStat.find(params[:id])
    @stat.destroy
    head :no_content
  end

  def user_stats
    user = User.find_by(id: params[:id])
    today_stat = user.activity_stats.today
    yesterday_stat = user.activity_stats.yesterday
    last_week_1_stats = user.activity_stats.last_week_1
    last_week_2_stats = user.activity_stats.last_week_2
    sum_of_today_stats = 0
    sum_of_yesterday_stats = 0
    sum_of_last_week_1_stats = 0
    sum_of_last_week_2_stats = 0
    today_stat.each do |s|
      sum_of_today_stats += s.steps.to_d
    end
    yesterday_stat.each do |s|
      sum_of_yesterday_stats += s.steps.to_d
    end
    last_week_1_stats.each do |s|
      sum_of_last_week_1_stats += s.steps.to_d
    end
    last_week_2_stats.each do |s|
      sum_of_last_week_2_stats += s.steps.to_d
    end
    calories_today = ActivityStat.calories_burned(today_stat)
    calories_yesterday = ActivityStat.calories_burned(yesterday_stat)
    calories_last_week_1 = ActivityStat.calories_burned(last_week_1_stats)
    calories_last_week_2 = ActivityStat.calories_burned(last_week_2_stats)
    height_in_meters = user.height * 0.3048
    bmi = (user.weight / height_in_meters * height_in_meters).truncate(1)
    render json: { today_stats: sum_of_today_stats, yesterday_stats: sum_of_yesterday_stats,
                   last_week_1_stats: sum_of_last_week_1_stats, last_week_2_stats: sum_of_last_week_2_stats,
                   height: user.height, weight: user.weight, bmi: bmi, today_calories: calories_today,
                   yesterday_calories: calories_yesterday, last_week_1_calories: calories_last_week_1,
                   last_week_2_calories: calories_last_week_2, today: Date.today, yesterday: Date.today - 1,
                   last_week_1: Date.today - 5, last_week_2: Date.today - 4 }
  end

  private

  def stat_params
    params.permit(:steps, :id, :user_id)
  end
end

# rubocop:enable all
