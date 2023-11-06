require 'rails_helper'

RSpec.describe "Monster Show page", type: :feature do
  describe "As a visitor" do
    describe "when I vist a monster show page" do
      it "I see the Monsters name and a section for stats", :vcr do
        VCR.use_cassette('monster') do
          visit "/monsters/aboleth"

          within("#monster_name") do
            expect(page).to have_content("Aboleth")
          end

          within("#monster_stats") do
            expect(page).to have_content("Hit Points")
            expect(page).to have_content("Armor class")
            expect(page).to have_content("Strength")
            expect(page).to have_content("Dexterity")
            expect(page).to have_content("Constitution")
            expect(page).to have_content("Intelligence")
            expect(page).to have_content("Wisdom")
            expect(page).to have_content("Charisma")
          end
        end
      end
      
      it "I see a section for monster attacks" do
        VCR.use_cassette('monster') do
          visit "/monsters/aboleth"

          within("#monster_attacks") do
            expect(page).to have_content("Name")
            expect(page).to have_content("Description")
            expect(page).to have_content("Multiattack")
            expect(page).to have_content("The aboleth makes three tentacle attacks.")
          end
        end
      end
    end
  end
end