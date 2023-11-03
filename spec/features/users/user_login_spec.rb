require 'rails_helper'


RSpec.describe "Login", type: :feature do
  before do
    @user = User.create(username: "user@example.com", password: "password")
  
    visit root_path
  end
  
  it 'can login with valid credentials' do
    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password

    click_on "Login"

    expect(current_path).to eq(root_path)
  end

  it "cannot login with invalid credentials" do
    click_on "Login"

    fill_in "Username", with: @user.username
    fill_in "Password", with: "bad password"

    click_on "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("There was a problem with your credentials, please try again.")
  end
end