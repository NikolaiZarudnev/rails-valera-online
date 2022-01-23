require 'rails_helper'
require 'spec_helper'
describe '#user', type: :feature do
  before do
    @user = User.create(id: 1, email: 'user1@gmail.com', password: 'password', name: 'User1', health: 100, alcohol: 0,
                        happy: 0, tired: 0, money: 300)
    act = ValeraAction.create('name' => 'Go to work',
                              'health' => '0',
                              'alcohol' => '-30',
                              'happy' => '-5',
                              'tired' => '70',
                              'money' => '100')
    act.conditions.create(attr_name: 'alcohol', min: 0, max: 70, attr_name_eff: 'none', value_eff: 0)
    visit '/session/new'
    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Name', with: 'User1'
    fill_in 'Password', with: 'password'
    click_button 'Save'
  end

  context 'when go to work' do
    it 'Go to page' do
      visit '/users/1'
      click_button 'Go to work'
      expect(page).to have_current_path('/users/1')
    end

    it 'Have menu text' do
      visit '/users/1'
      click_button 'Go to work'
      expect(page).to have_text('LOG OUT Records')
    end

    it 'Have alert text' do
      visit '/users/1'
      click_button 'Go to work'
      click_button 'Go to work'
      expect(page).to have_text('You')
    end
  end
end
