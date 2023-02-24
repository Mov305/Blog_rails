require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    context 'check the validity of the comments' do
      user = User.new(name: 'Tomi', photo: '', bio: 'I am Tomi')
      post = Post.new(user:, title: 'Hello', text: 'Text')

      it 'should save successfully' do
        @comment = Comment.create(post:, user:, text: 'Hi Tomi!')
        expect(@comment).to be_valid
      end

      it 'err to the nil post' do
        @comment = Comment.create(post: nil, user:, text: 'Hi Tomi!')
        expect(@comment).to_not be_valid
      end

      it 'err to the nil user' do
        @comment = Comment.create(post:, user: nil, text: 'Hi Tomi!')
        expect(@comment).to_not be_valid
      end
    end
  end
  describe 'Associations and methods' do
    user = User.new(name: 'Tomi', photo: '', bio: 'I am Tomi')
    post = Post.new(user:, title: 'Hello', text: 'Text')

    it 'should return the post of the comment' do
      @comment = Comment.new(post:, user:, text: 'Hi Tomi!')
      expect(@comment.post).to eq(post)
    end

    it 'should return the number of comments' do
      expect(post.comments_counter).to eq(0)
    end
  end
end
