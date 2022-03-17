require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it "get root page, renders 'index' template" do
      get '/users'
      expect(response).to have_http_status(200)
    end

  end
end
