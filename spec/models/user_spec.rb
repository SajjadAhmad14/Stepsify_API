require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many activities' do
    user = described_class.reflect_on_association(:activities)
    expect(user.macro).to eq :has_many
  end
  it 'has many activit_stats' do
    user = described_class.reflect_on_association(:activity_stats)
    expect(user.macro).to eq :has_many
  end
  it 'is not valid without user name' do
    user = User.new(password: '12345', sex: 'Male', height: 0.0, weight: 0.0)
    expect(user).to_not be_valid
  end
  it 'is not valid without password' do
    user = User.new(username: 'test1', sex: 'Male', height: 0.0, weight: 0.0)
    expect(user).not_to be_valid
  end
  it 'is not valid without sex' do
    user = User.new(username: 'test1', password: '12345', height: 0.0, weight: 0.0)
    expect(user).not_to be_valid
  end
  it 'is not valid without height' do
    user = User.new(username: 'test1', password: '12345', sex: 'male', weight: 0.0)
    expect(user).not_to be_valid
  end
  it 'is not valid without weight' do
    user = User.new(username: 'test1', password: '12345', sex: 'male', height: 0.0)
    expect(user).not_to be_valid
  end
  it 'is valid if all the parameters are present' do
    user = User.new(username: 'test1', password: '12345', sex: 'male', height: 0.0, weight: 0.0)
    expect(user).to be_valid
  end
end
