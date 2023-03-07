require 'rails_helper'

RSpec.describe 'user/index.html.erb', type: :system do
  before :all do
    Like.destroy_all
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
    @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  it "displays the user's name" do
    visit users_path
    expect(page).to have_content('Users')
  end

  it "displays the user's photo" do
    visit users_path
    expect(page.body).to include(@user1.photo)
  end

  it 'displays the number of posts' do
    visit users_path
    expect(page).to have_content(@user1.posts.count)
  end

  it "redirects to the user's posts page" do
    visit users_path
    click_link(@user1.name)
    click_button('See all posts')
    expect(page).to have_current_path(user_posts_path(@user1.id))
  end
end
