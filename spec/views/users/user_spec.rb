require "rails_helper"

RSpec.describe "user/index.html.erb", type: :system do
  before :all do
    Like.destroy_all if Like.count > 0
    Comment.destroy_all if Comment.count > 0
    Post.destroy_all if Post.count > 0
    User.destroy_all if User.count > 0
    @user1 = User.create(name: "Tom", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Mexico.")
  end

  it "displays the user's name" do
    visit "http://localhost:3000/"
    expect(page).to have_content("Users")
  end

  it "displays the user's photo" do
    visit "http://localhost:3000/"
    expect(page.body).to include(@user1.photo)
  end

  it "displays the number of posts" do
    visit "http://localhost:3000/"
    expect(page).to have_content(@user1.posts.count)
  end

  it "redirects to the user's posts page" do
    visit "http://localhost:3000/"
    click_link(@user1.name)
    click_button('See all posts')
    expect(page).to have_current_path(user_posts_path(@user1.id))
  end
end
