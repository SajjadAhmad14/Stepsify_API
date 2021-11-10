class ActivityStat < ApplicationRecord
  belongs_to :user
  validates :steps, presence: true
  
  def self.calories_burned(stats)
    sum = 0.0
    stats.each do |stat|
      sum += stat.steps * 55
    end
    sum
  end

  def self.today
     ActivityStat.where("DATE(created_at) = ?", Date.today)
  end

  def self.yesterday
    ActivityStat.where("DATE(created_at) = ?", Date.today-1)
  end

  def self.last_week
    ActivityStat.where("DATE(created_at) < ?", 7.days.ago)
  end

  def self.steps(stats)
    sum = 0.0
    stats.each do |stat|
      sum += stat.steps
    end
    sum
  end
end
