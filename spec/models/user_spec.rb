require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'check the validity of the users' do
      it 'should save successfully' do
        @user = User.new(name: 'Tomi', photo: '', bio: 'I am Tomi')
        expect(@user).to be_valid
      end

      it 'err to the nil name' do
        @user = User.new(name: nil, photo: '', bio: 'I am Tomi')
        expect(@user).to_not be_valid
      end
    end
  end

  describe 'Associations and methods' do
    user = User.new(name: 'Tomi', photo: '', bio: 'I am Tomi')
    it 'should return the number of posts' do
      expect(user.posts_counter).to eq(0)
    end
    it 'should return an array of posts' do
      expect(user.return_recent_posts).to eq([])
    end
  end
end
