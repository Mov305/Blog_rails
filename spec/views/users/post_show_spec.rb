require 'rails_helper'
RSpec.describe 'User post show page Capybara integration test', type: :system do
  before :all do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
    first_user = User.create(name: 'Tom', photo: 'https://i.ibb.co/CP4m1b4/img.jpg', bio: 'Teacher from Mexico.')
    second_user = User.create(name: 'Lilly', photo: 'https://i.ibb.co/CP4m1b4/img.jpg',
                              bio: 'Teacher from Poland.')
    first_post = Post.create(user: first_user, title: 'Hello', text: 'This is my first post')
    second_post = Post.create(user: first_user, title: 'Amazing App', text: 'This is my second post')
    third_post = Post.create(user: first_user, title: 'Fantastic', text: 'This is my third post')
    forth_post = Post.create(user: second_user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: first_post, user: second_user, text: 'Hi Tom!')
    Comment.create(post: second_post, user: second_user, text: 'Amazing Tom!')
    Comment.create(post: third_post, user: second_user, text: 'Brilliant Tom!')
    Comment.create(post: forth_post, user: first_user, text: 'Brilliant Lilly!')
    Comment.create(post: first_post, user: first_user, text: 'Thanks Lilly!')
    Comment.create(post: second_post, user: first_user, text: 'Thanks Lilly!')
    Like.create(post: first_post, user: first_user)
    @first_user = User.first
    @first_post = first_user.posts.first
  end
  it 'test seeing the post title' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.title.to_s)
  end
  it 'test seeing the name of the post writer ' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.user.name.to_s)
  end
  it 'test seeing the number of comments it has' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content("#{@first_post.comments_counter} comments")
  end
  it 'test seeing the number of likes it has' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content("#{@first_post.likes_counter} likes")
  end
  it 'test seeing the post body' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.text.to_s)
  end
  it 'test seeing the username of a random commentor' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.comments.first.user.name.to_s)
  end
  it 'test seeing the comment of a random commentor' do
    visit "/users/#{@first_user.id}/posts/#{@first_post.id}"
    expect(page).to have_content(@first_post.comments.first.text.to_s)
  end
end
