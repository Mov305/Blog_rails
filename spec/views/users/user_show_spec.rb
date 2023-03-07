require "rails_helper"

RSpec.describe "user/show.html.erb", type: :system do
  before :all do
    Like.destroy_all 
    Comment.destroy_all 
    Post.destroy_all 
    User.destroy_all
    @user1 = User.create(name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.")
    @user2 = User.create(name: "Bob", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.")
    @post1 = Post.create(title: "Post 1", text: "Post 1 text", user_id: @user1.id)
    @post2 = Post.create(title: "Post 2", text: "Post 2 text", user_id: @user2.id)
    @comment1 = Comment.create(text: "Comment 1", user_id: @user1.id, post_id: @post1.id)
    @comment2 = Comment.create(text: "Comment 2", user_id: @user2.id, post_id: @post2.id)
  end

  it "displays the user name" do
    visit "http://localhost:3000"
    click_link(@user1.name)
    expect(page).to have_content(@user1.name)
  end

  it "displays the user photo" do
    visit "http://localhost:3000"
    click_link(@user1.name)
    expect(page.body).to include(@user1.photo)
  end

  it "displays the user bio" do
    visit "http://localhost:3000"
    click_link(@user1.name)
    expect(page).to have_content(@user1.bio)
  end

  it "displays the number of posts" do
    visit "http://localhost:3000"
    click_link(@user1.name)
    expect(page).to have_content(@user1.posts.count)
  end

  it "displays the user posts" do
    visit "http://localhost:3000"
    click_link(@user1.name)
    expect(page).to have_content(@post1.title)
  end

  it "redirects to the user posts page" do
    visit "http://localhost:3000"
    click_link(@user1.name)
    click_link("See all posts")
    expect(page).to have_current_path(user_posts_path(@user1.id))
  end
end
