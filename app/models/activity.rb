class Activity < ApplicationRecord
  belongs_to :user
  validates :target, presence: true
end
