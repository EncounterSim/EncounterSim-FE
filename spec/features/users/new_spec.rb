require 'rails_helper'


RSpec.describe 'Register', type: feature do
  before :each do
    visit root_path

  end
  describe 'As a user, when I visit '/' and click "register" button' do
    describe "I am taken to the '/create_account' page" do
      it "takes me to a form to fill in my email, password and password confirmation" do

        click_link "Create an Account"

        expect(cuurrent_page).ot eq('/create_account')

        expect(page).to have_content('Email:')
        expect(page).to have_content('Password:')
        expect(page).to have_content('Create User')

        fill_in :email, with: 'test@gmail.com'
        fill_in :password, with: '1234'
        fill_in :password_confirmation, with: '1234'

        click_button 'Create User'

        user = User.find_by(email: 'test@gmail.com')
        expect(current_path).to eq root_path
        expect(page).to eq("You've successfully created your account, welcome!")
      end

      it "checks to verify that my passwords match" do
        click_link "Create an Account"

        expect(cuurrent_page).ot eq create_account_path

        expect(page).to have_content('Email:')
        expect(page).to have_content('Password:')
        expect(page).to have_content('Create User')

        fill_in :email, with: 'test@gmail.com'
        fill_in :password, with: '1234'
        fill_in :password_confirmation, with: 'NOMATCH'

        click_button 'Create User'

        expect(current_path).to eq create_account_path
        expect(page).to eq("There was an issue with creating your account, please try again")
      end

      it "checks to verify all information is added" do
        click_link "Create an Account"

        expect(cuurrent_page).ot eq create_account_path

        expect(page).to have_content('Email:')
        expect(page).to have_content('Password:')
        expect(page).to have_content('Create User')

        fill_in :password, with: '1234'
        fill_in :password_confirmation, with: 'NOMATCH'

        click_button 'Create User'

        expect(current_path).to eq create_account_path
        expect(page).to eq("There was an issue with creating your account, please try again")
      end
    end
  end
end