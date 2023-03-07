require "rails_helper"

RSpec.describe "user/index.html.erb", type: :system do
  it "shows the user" do
    visit 'http://localhost:3000/'
    expect(page).to have_content("Users")
  end
end
