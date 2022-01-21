require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Request index' do
    subject = 'test@mail.com'
    it 'assigns user email' do
      user = User.create(email: 'test@mail.com')

      expect(subject).to eq(user.email)
    end

    it 'assigns the all users' do
      subject { User.all }
      expect(subject).to eq('test@mail.com')
    end
  end
end
