require 'rails_helper'

describe 'the log in process', type: :feature do
  before do
    User.create(email: 'user1@gmail.com', password: 'password', name: 'User1', health: 100, alcohol: 0, happy: 0,
                tired: 0, money: 0)
  end

  it 'log @user in' do
    visit '/session/new'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Name', with: 'User1'
    fill_in 'Password', with: 'password'
    click_button 'Save'
    # expect(user2).to eq('asd')
    expect(page).to have_current_path("/users/#{User.last.id}", ignore_query: true)
    expect(page).to have_text('LOG OUT Records')
  end
end

require 'rails_helper'
