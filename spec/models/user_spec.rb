require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new( name: ' ', photo: 'https://images.pexels.com/photos/6171563/pexels-photo-6171563.jpeg', bio: 'Artist from wonderland', posts_counter: 1 )
  end

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Posts counter should not be nil' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

end


