require 'rails_helper'

RSpec.describe 'Devise', type: :request do
  describe 'GET /sign_in' do
    subject { User.new(name: 'Jacky', email: 'jacky@email.com', password: '123456', password_confirmation: '123456') }

    before do
      subject.skip_confirmation!
      subject.save
    end

    before(:example) do
      get new_user_session_path
    end

    it 'request is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body has expected title text' do
      expect(response.body).to include('Log In')
    end
  end
end
