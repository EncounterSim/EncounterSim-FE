RSpec.describe "Login", type: :feature do
  before do
    @user = User.create(username: "user", password: "password")
  
    visit root_path
  end
  
  it 'can login with valid credentials' do
    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password

    click_on "Login"

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