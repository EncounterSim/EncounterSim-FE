require 'rails_helper'


RSpec.describe "Login", type: :feature do
  before do
    @user = User.create(email: "user@gmail.com", username: "123465", password: "password")
  
    visit root_path
  end

  it 'can login with valid credentials' do
    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in :email, with: @user.email
    fill_in "Password", with: @user.password

    click_on "Login"

    expect(current_path).to eq(root_path)
  end

it "cannot login with invalid credentials" do
    click_on "Login"

    fill_in :email, with: @user.email
    fill_in "Password", with: "bad password"

    click_on "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("There was a problem with your credentials, please try again.")
  end
  
  it 'can login with valid credentials using magic link' do
    click_on "Login"
    expect(current_path).to eq(login_path)

    expect(page).to have_content("Login")
    expect(page).to have_content("Three ways to login!")
    expect(page).to have_content("Standard Login:")
    expect(page).to have_content("Please enter your email and password to login.")
    expect(page).to have_content("Passwordless Login:")
    expect(page).to have_content("Please enter your email, login link will be emailed.")
    expect(page).to have_content("Github Login:")

    fill_in :pemail, with: @user.email

    click_on "Get a Magic Link"
    user = User.find_by(email: @user.email)
    visit "/sessions/create?login_token=#{user.login_token}"

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    email = ActionMailer::Base.deliveries.last
    expect(email.subject).to eq('Sign into EncounterSim!')
    expect(email.from[0]).to eq('MagicLink@EncounterSim.com')
    expect(email.to[0]).to eq(user.email)

    expect(current_path).to eq root_path
    expect(page).to have_content("Congrats, you are signed in!")
    expect(page).to have_content("Create a New Encounter")
  end

  it "cannot login without a valid email" do
    click_on "Login"

    fill_in :email, with: "NOMATCH@gmail.com"

    click_on "Get a Magic Link"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Email is not associated with an account, please create an account or add another email.")
  end

  it "cannot login with magic link after expired" do
    click_on "Login"

    fill_in :pemail, with: @user.email

    click_on "Get a Magic Link"
    user = User.find_by(email: @user.email)
    Timecop.travel(61.minutes.from_now)

    visit "/sessions/create?login_token=#{user.login_token}"
    expect(current_path).to eq root_path
    expect(page).to have_content("Invalid or expired login link")
  end
end