require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Request index' do
    subject = 'test@mail.com'
    it 'assigns user email' do
      user = User.create(email: 'test@mail.com')

      expect(subject).to eq(user.email)
    end
  end
end
