require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    context 'check the validity of the posts' do
      user = User.new(name: 'Tomi', photo: '', bio: 'I am Tomi')
      it 'should save successfully' do
        @post = Post.new(user:, title: 'Hello', text: 'Text')
        expect(@post).to be_valid
      end
      it 'err to the nil user' do
        @post = Post.new(user: nil, title: 'Hello', text: 'Text')
        expect(@post).to_not be_valid
      end
      it 'err to the nil title' do
        @post = Post.new(user:, title: nil, text: 'Text')
        expect(@post).to_not be_valid
      end
    end
  end
  describe 'Associations and methods' do
    user = User.new(name: 'Tomi', photo: '', bio: 'I am Tomi')
    post = Post.new(user:, title: 'Hello', text: 'Text')
    it 'should return the user of the post' do
      expect(post.user).to eq(user)
    end
    it 'should return the number of comments' do
      expect(post.comments_counter).to eq(0)
    end
    it 'should return the number of likes' do
      expect(post.likes_counter).to eq(0)
    end
    it 'should return the 5 most recent comments' do
      expect(post.return_recent_comments).to eq([])
    end
  end
end
