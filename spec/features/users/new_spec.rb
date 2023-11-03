require 'rails_helper'

RSpec.describe "Register", type: :feature do
  before :each do
    visit root_path

  end
  describe "As a user, when I visit '/' and click 'register' button" do
    describe "I am taken to the '/create_account' page" do
      it "takes me to a form to fill in my email, password and password confirmation" do

        click_button "Create An Account"

        expect(current_path).to eq new_user_path

        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
        expect(page).to have_button('Create User')

        fill_in :Email, with: 'test@gmail.com'
        fill_in "Password", with: '1234'
        fill_in "Confirm Password", with: '1234'

        click_button 'Create User'

        user = User.find_by(email: 'test@gmail.com')
        expect(current_path).to eq root_path
        expect(page).to have_content("You've successfully created your account with test@gmail.com, welcome!")
      end

      it "checks to verify that my passwords match" do
        click_button "Create An Account"

        expect(current_path).to eq new_user_path

        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
        expect(page).to have_button('Create User')

        fill_in :Email, with: 'test@gmail.com'
        fill_in "Password", with: '1234'
        fill_in "Confirm Password", with: 'NOMATCH'

        click_button 'Create User'

        expect(current_path).to eq new_user_path
        expect(page).to have_content("There was an issue creating your account, please try again")
      end

      it "checks to verify all information is added" do
        click_button "Create An Account"

        expect(current_path).to eq new_user_path

        expect(page).to have_content('Email')
        expect(page).to have_content('Password')
        expect(page).to have_button('Create User')

        fill_in "Password", with: '1234'
        fill_in "Confirm Password", with: 'NOMATCH'

        click_button 'Create User'
        expect(current_path).to eq new_user_path
        expect(page).to have_content("There was an issue creating your account, please try again")
      end
    end
  end
end