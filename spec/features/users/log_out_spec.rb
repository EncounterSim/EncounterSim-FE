RSpec.describe "Login", type: :feature do
  before do
    @user = User.create(email: "user@gmail.com", username: "1234")
  
    visit root_path
  end
  
  it 'can login with valid credentials' do
    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in "Email", with: @user.email

    click_on "Get a Magic Link"
    user = User.find_by(email: @user.email)
    visit "/sessions/create?login_token=#{user.login_token}"
    expect(current_path).to eq root_path
    expect(page).to have_content("Congrats, you are signed in!")

    expect(current_path).to eq(root_path)

    expect(page).to have_link("Log Out")
    click_link "Log Out"
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logged out successfully")
    expect(page).to_not have_content("Create An Encounter")
    expect(page).to_not have_content("Log Out")
    expect(page).to have_content("Create An Account")
    expect(page).to have_content("Login")
  end
end