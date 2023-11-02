require 'rails_helper'


RSpec.describe 'Session timeout', type: :feature do
  it 'expires the session after 15 minutes' do
    @user = User.create(email: 'user@example.com', password: 'password')

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_on 'Login'

    expect(page).to have_current_path(root_path)

    expect(page).to have_content('Log Out')
    
    Timecop.travel(15.minutes.from_now)

    visit root_path

    expect(page).to have_content('Login')
  end
end