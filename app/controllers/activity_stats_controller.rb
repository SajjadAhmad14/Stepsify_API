class ActivityStatsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    @stat = user.activity_stats.create!(stat_params)
    if !@stat.valid?
      render json: { errors: @stat.errors.full_messages }
    end
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
    today_stat = user.activity_stats.today()
    render json: { stats: today_stat }
    # today_stpes = ActivityStat.steps(today_stat)
    # calories_today = ActivityStat.calories_burned(today_stat)
    # yesterday_stat = ActivityStat.yesterday()
    # yesterday_steps = ActivityStat.steps(yesterday_stat)
    # yesterday_calories = ActivityStat.calories_burned(yesterday_stat)
    # last_week_stat = ActivityStat.last_week
    # last_week_steps = ActivityStat.steps(last_week_stat)
    # last_week_calories = ActivityStat.calories_burned(last_week_stat).round(2)
    # render json: { today: Date.today, today_stat: today_stpes, calories_today: calories_today, yesterday: Date.today - 1, yesterday_stat: yesterday_steps,
    #   yesterday_calories: yesterday_calories, last_week: Date.today - 7, last_week_stat: last_week_steps, last_week_calories: last_week_calories
    # }
  end

  private

  def stat_params
    params.permit(:steps, :id, :user_id)
  end
end
