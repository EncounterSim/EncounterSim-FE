require 'rails_helper'

RSpec.describe "Welcome#index", type: :feature do
  before :each do
    @user = User.create(email: "user@example.com", username: "234")

    visit root_path
  end
  describe "As a user, when I visit '/'" do
    it "I see a link to create an account and another to login" do
      expect(page).to have_button "Create An Account"
      expect(page).to have_button "Login"
      click_button "Create An Account"
      expect(current_path).to eq new_user_path
      
      visit root_path
      click_button "Login"
      expect(current_path).to eq login_path
    end

    describe "the root page should have the title of the application at the center and top of the page" do
      it "should also have navigation at the top of the page for 'home', 'monsters' 'login'/'logout'" do
        
        expect(page).to have_link "Home"
        expect(page).to have_link "Monsters"
        expect(page).to have_link "Log In"
        click_on "Login"

        expect(current_path).to eq(login_path)


        fill_in "Email", with: @user.email
    
        click_on "Get a Magic Link"

        user = User.find_by(email: @user.email)
        visit "/sessions/create?login_token=#{user.login_token}"
        expect(current_path).to eq root_path
        expect(page).to have_content("Congrats, you are signed in!")
        expect(page).to have_content("Create a New Encounter")
    
        expect(current_path).to eq(root_path)
        expect(page).to have_link "Home"
        expect(page).to have_link "Monsters"
        expect(page).to have_link "Log Out"
    end
  end
  end
end