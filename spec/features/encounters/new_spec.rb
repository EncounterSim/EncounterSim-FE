require 'rails_helper'

RSpec.describe "encounters#new", type: :feature do
  before :each do
    @user = User.create(email: "user@gmail.com", username: "123465")

    visit root_path
  end

  describe "from the welcome page, once I log in, I should see a button to 'create new encounter'" do
    it 'this will route me to a create_encounter page where I pick a monster and other encounter details' do
      click_on "Login"

      expect(current_path).to eq(login_path)
  
      fill_in "Email", with: @user.email

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

        within (".character1") do
          expect(page).to have_content ("Character (1)")
          expect(page).to have_content ("Class")
          expect(page).to have_content ("Level")
          expect(page).to have_content ("Modifiers")
          expect(page).to have_content ("Strength")
          expect(page).to have_content ("Dexterity")
          expect(page).to have_content ("Constitution")
          expect(page).to have_content ("Wisdom")
          expect(page).to have_content ("Charisma")
          expect(page).to have_content ("Intelligence")
          expect(page).to have_content ("Spells")
          expect(page).to have_content ("Spell 1")
          expect(page).to have_content ("Spell 2")
          expect(page).to have_content ("Spell 3")
          expect(page).to have_content ("Hit Points")
          expect(page).to have_content ("Armor Class")
          expect(page).to have_content ("Base Damage Dice")
          expect(page).to have_content ("*")
        end

        within (".character5") do
          expect(page).to have_content ("Character (5)")
          expect(page).to have_content ("Class")
          expect(page).to have_content ("Level")
          expect(page).to have_content ("Modifiers")
          expect(page).to have_content ("Strength")
          expect(page).to have_content ("Dexterity")
          expect(page).to have_content ("Constitution")
          expect(page).to have_content ("Wisdom")
          expect(page).to have_content ("Charisma")
          expect(page).to have_content ("Intelligence")
          expect(page).to have_content ("Spells")
          expect(page).to have_content ("Spell 1")
          expect(page).to have_content ("Spell 2")
          expect(page).to have_content ("Spell 3")
          expect(page).to have_content ("Hit Points")
          expect(page).to have_content ("Armor Class")
          expect(page).to have_content ("Base Damage Dice")
          expect(page).to have_content ("*")
        end

        # expect(page).to have_content("Add Character")
      end

    end
  end
end