class User < ApplicationRecord
  has_secure_password
  has_many :activities, dependent: :destroy
  has_many :activity_stats, dependent: :destroy
  validates :username, uniqueness: true
  validates :username, :password, :sex, :height, :weight, presence: true
end
