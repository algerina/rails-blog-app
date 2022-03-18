require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it ' renders http' do
      get '/users'
      expect(response).to have_http_status(200)
    end
  end
end
