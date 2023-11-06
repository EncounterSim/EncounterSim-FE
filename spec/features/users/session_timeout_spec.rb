require 'rails_helper'


RSpec.describe 'Session timeout', type: :feature do
  it 'expires the session after 15 minutes' do
    @user = User.create(email: 'user@example.com', username: '12345')

    visit root_path

    click_on 'Login'

    fill_in "Email", with: @user.email

    click_on "Get a Magic Link"
    user = User.find_by(email: @user.email)
    visit "/sessions/create?login_token=#{user.login_token}"
    expect(current_path).to eq root_path
    expect(page).to have_content("Congrats, you are signed in!")
    expect(page).to have_content("Create a New Encounter")

    expect(page).to have_current_path(root_path)

    expect(page).to have_content('Log Out')
    
    Timecop.travel(15.minutes.from_now)

    visit root_path

    expect(page).to have_content('Login')
  end
end