require 'rails_helper'

RSpec.describe "encounters#new", type: :feature do
  before :each do
    @user = User.create(email: "user@gmail.com", username: "123465", password: "password")

    visit root_path
  end

  describe "user must be logged in to user Sim" do
    it 'user cannot use encounter sim if not logged in' do
      visit new_encounter_path

      expect(current_path).to eq(login_path)
      expect(page).to have_content("You must be logged in to access this section")
  
      fill_in :pemail, with: @user.email
      click_on "Get a Magic Link"
      user = User.find_by(email: @user.email)
      visit "/sessions/create?login_token=#{user.login_token}"
      expect(current_path).to eq root_path
      expect(page).to have_content("Congrats, you are signed in!")
      expect(page).to have_content("Create a New Encounter")
        
      VCR.use_cassette('encounter_list') do
        click_button "Create a New Encounter"
        expect(current_path).to eq new_encounter_path
        
        expect(page).to have_content ("Encounter Creation")
        expect(page).to have_content ("Monster")
      end

    end
  end
end