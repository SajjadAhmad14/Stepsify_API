require 'rails_helper'

RSpec.describe ActivityStat, type: :model do
  it 'belongs to user' do
    activity_stat = described_class.reflect_on_association(:user)
    expect(activity_stat.macro).to eq :belongs_to
  end
  it 'is not valid without steps' do
    activity_stat = ActivityStat.new
    expect(activity_stat).to_not be_valid
  end
  it 'is valid when steps param is present' do
    user = User.create!(username: 'test4', password: '12345', sex: 'male', height: 0.0, weight: 0.0)
    activity_stat = ActivityStat.new(steps: 0.0, user_id: user.id)
    expect(activity_stat).to be_valid
  end
end
