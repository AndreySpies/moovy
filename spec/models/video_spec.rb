require 'rails_helper'

RSpec.describe Video, type: :model do
  user = User.new(email: 'user@gmail.com', password: 'password')
  it 'Video must have a user' do
    video = Video.new(user: user)
    expect(video.user).to be_a(User)
  end

  it 'Video must have a valid name' do
    video = Video.new(name: 'Big movie')
    expect(video.name).to eq('Big movie')
  end

  it 'Video must have user and valid name' do
    video = Video.new(user: user, name: 'Little movie')
    expect(video).to be_valid
  end

  it 'Video with invalid characters in name must be invalid' do
    video = Video.new(user: user, name: 'Wrong n@me')
    expect(video).not_to be_valid
  end
end
