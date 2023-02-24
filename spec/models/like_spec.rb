require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations' do
    user = User.new(name: 'Tomi', photo: '', bio: 'I am Tomi')
    post = Post.new(user:, title: 'Hello', text: 'Text')
    it 'should save successfully' do
      @like = Like.new(post:, user:)
      expect(@like).to be_valid
    end
    it ' err to the nil post' do
      @like = Like.new(post: nil, user:)
      expect(@like).to_not be_valid
    end
    it ' err to the nil user' do
      @like = Like.new(post:, user: nil)
      expect(@like).to_not be_valid
    end
  end
end
