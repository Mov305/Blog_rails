require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /posts #index" do
    subject { get "/users/:user_id/posts" }
    before { subject }

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end

    it "has the correct placeholder text" do
      expect(response.body).to include("posts")
    end
  end

  describe "GET /posts #show" do
    subject { get "/users/:user_id/posts/:post_id" }
    before { subject }

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "has the correct placeholder text" do
      expect(response.body).to include("post")
    end
  end
end
