require 'rails_helper'

RSpec.describe "encounters#new", type: :feature do
  before :each do
    @user = User.create(email: "user@example.com", password: "password")

    visit root_path
  end

  describe "from the welcome page, once I log in, I should see a button to 'create new encounter'" do
    it 'this will route me to a create_encounter page where I pick a monster and other encounter details' do
      click_on "Login"

      expect(current_path).to eq(login_path)
  
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
  
      click_on "Login"
      expect(current_path).to eq root_path
  
      
      expect(page).to have_button("Create a New Encounter")
      
      VCR.use_cassette('encounter_list') do
        click_button "Create a New Encounter"
        expect(current_path).to eq new_encounter_path
        
        expect(page).to have_content ("Encounter Creation")
        expect(page).to have_content ("Monster")

        within (".character1") do
          expect(page).to have_content ("Character(1)")
          expect(page).to have_content ("Class")
          expect(page).to have_content ("Level")
          expect(page).to have_content ("Ability Modifiers")
        end

        within (".character6") do
          expect(page).to have_content ("Character(6)")
          expect(page).to have_content ("Class")
          expect(page).to have_content ("Level")
          expect(page).to have_content ("Ability Modifiers")
        end

        # expect(page).to have_content("Add Character")
      end

    end
  end
end