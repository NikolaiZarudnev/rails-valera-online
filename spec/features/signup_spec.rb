require 'rails_helper'
require 'spec_helper'
describe 'the sign up process', type: :feature do
  it 'sign @user up' do
    visit '/users/new'

    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Name', with: 'user1'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Create User'
    expect(current_path).to eq("/users/#{User.last.id}")
    expect(page).to have_text('LOG OUT Records')
  end
end
