require 'rails_helper'

RSpec.describe Activity, type: :model do
  it 'belongs to user' do
    activity = described_class.reflect_on_association(:user)
    expect(activity.macro).to eq :belongs_to
  end
  it 'is not valid without target' do
    activity = Activity.new
    expect(activity).to_not be_valid
  end
  it 'is valid when target param is present' do
    user = User.create!(username: 'test3', password: '12345', sex: 'male', height: 0.0, weight: 0.0)
    activity = Activity.new(target: 0.0, user_id: user.id)
    expect(activity).to be_valid
  end
end
