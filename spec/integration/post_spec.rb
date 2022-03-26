require 'swagger_helper'

describe 'Blog API' do

  path '/api/users/:user_id/posts', do
  

        get 'Retrieve posts' do
          tags 'Posts'
          produces 'application/json', 'application/xml'
          parameter name: :id, :in => :path, :type => :string
    
          response '200', 'name found' do
            schema type: :object,
              properties: {
                id: { type: :integer, },
                name: { type: :string },
                photo: { type: :string },
                status: { type: :string }
              },
              required: [ 'id', 'name', 'status' ]
    
            let(:id) { Post.create(name: 'foo', status: 'bar', photo: 'http://example.com/avatar.jpg').id }
            run_test!
          end
    
          response '404', 'post not found' do
            let(:id) { 'invalid' }
            run_test!
          end
        end
      end
    end
end