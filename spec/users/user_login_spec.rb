require 'rails_helper'


RSpec.describe "Login", type: :feature do
  before do
    @user = User.create(email: "user@example.com", password: "password")
  
    visit root_path
  end
  
  it 'can login with valid credentials' do
    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_on "Login"

    expect(current_path).to eq(root_path)
  end

  it "cannot login with invalid credentials" do
    click_on "Login"

    fill_in "Email", with: @user.email
    fill_in "Password", with: "bad password"

    click_on "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end