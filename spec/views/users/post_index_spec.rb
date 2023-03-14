require 'rails_helper'
RSpec.describe 'User post index page Capybara integration test', type: :system do
  before :all do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
    first_user = User.create(name: 'Tom', photo: 'https://i.ibb.co/CP4m1b4/img.jpg', bio: 'Teacher from Mexico.')
    second_user = User.create(name: 'Lilly', photo: 'https://i.ibb.co/CP4m1b4/img.jpg',
                              bio: 'Teacher from Poland.')
    first_post = Post.create(user_id: first_user.id, title: 'HELLO', text: 'This is my first post')
    second_post = Post.create(user_id: first_user.id, title: 'AMAZING APP', text: 'This is my second post')
    third_post = Post.create(user_id: first_user.id, title: 'FANTASTIC', text: 'This is my third post')
    forth_post = Post.create(user_id: first_user.id, title: 'BRILLIANT APP', text: 'This is my forth post')
    Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi Tom!')
    Comment.create(post_id: second_post.id, user_id: second_user.id, text: 'Amazing Tom!')
    Comment.create(post_id: third_post.id, user_id: second_user.id, text: 'Brilliant Tom!')
    Comment.create(post_id: forth_post.id, user_id: first_user.id, text: 'Brilliant Lilly!')
    Comment.create(post_id: first_post.id, user_id: first_user.id, text: 'Thanks Lilly!')
    Comment.create(post_id: second_post.id, user_id: first_user.id, text: 'Thanks Lilly!')
    Like.create(post_id: first_post.id, user_id: first_user.id)
  end
  it "test seeing the user's profile picture" do
    first_user = User.first
    visit "/users/#{first_user.id}/posts"
    expect(page).to have_css("img[src*='https://i.ibb.co/CP4m1b4/img.jpg']")
  end
  it 'test seeing the user username' do
    first_user = User.first
    visit "/users/#{first_user.id}/posts"
    expect(page).to have_content(first_user.name)
  end
  it 'test seeing the user number of posts' do
    first_user = User.first
    number_of_posts = first_user.posts_counter
    visit "/users/#{first_user.id}/posts"
    expect(page).to have_content(number_of_posts)
  end
  it 'test seeing the user post title ' do
    first_user = User.first
    post_title = first_user.posts.last.title
    visit "/users/#{first_user.id}/posts"
    expect(page).to have_content(post_title)
  end
  it 'test seeing the user post body' do
    first_user = User.first
    post_body = first_user.posts.first.text
    visit "/users/#{first_user.id}/posts"
    expect(page).to have_content(post_body.to_s)
  end
  it 'test seeing the user post first comment' do
    first_user = User.first
    post_first_comment = first_user.posts.first.comments.first.text
    visit "/users/#{first_user.id}/posts"
    expect(page).to have_content(post_first_comment.to_s)
  end
  it 'test seeing the number of comments in a certain post' do
    first_user = User.first
    number_of_comments = first_user.posts.first.comments_counter
    visit "/users/#{first_user.id}/posts"
    expect(page).to have_content(number_of_comments)
  end
  it 'test seeing the number of likes in a certain post' do
    first_user = User.first
    number_of_likes = first_user.posts.first.likes_counter
    visit "/users/#{first_user.id}/posts"
    expect(page).to have_content(number_of_likes)
  end
  it 'test the functionality of  pagination button ' do
    first_user = User.first
    post_3_title = first_user.posts.first(3)[2].title
    visit "/users/#{first_user.id}"
    click_button('See all posts')
    expect(page).to have_content(post_3_title.to_s)
  end
  it "test redirecting to that post's show page" do
    first_user = User.first
    visit "/users/#{first_user.id}/posts"
    id = page.find_all('article')[0][:id]
    page.find_all('article')[0].click
    expect(page).to have_current_path("/users/#{first_user.id}/posts/#{id}")
  end
end
