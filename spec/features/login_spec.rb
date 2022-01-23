require 'rails_helper'

describe 'the log in process', type: :feature do
  before do
    User.create(email: 'user1@gmail.com',
                password: 'password',
                name: 'User1',
                health: 100,
                alcohol: 0,
                happy: 0,
                tired: 0,
                money: 0)
  end
  # rubocop:disable RSpec/ExampleLength

  it 'go to page current user' do
    visit '/session/new'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Name', with: 'User1'
    fill_in 'Password', with: 'password'
    click_button 'Save'
    expect(page).to have_current_path("/users/#{User.last.id}", ignore_query: true)
  end

  it 'have standart text' do
    visit '/session/new'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Name', with: 'User1'
    fill_in 'Password', with: 'password'
    click_button 'Save'
    expect(page).to have_text('LOG OUT Records')
  end
  # rubocop:enable RSpec/ExampleLength
end
