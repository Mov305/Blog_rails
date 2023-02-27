require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    # controller => users, action => index
    subject { get '/users' }
    before { subject }

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('users')
    end
  end

  describe 'GET #show' do
    # controller => users, action => show
    subject { get '/users/1' }
    before { subject }

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'has the correct placeholder text' do
      expect(response.body).to include('user')
    end
  end
end
