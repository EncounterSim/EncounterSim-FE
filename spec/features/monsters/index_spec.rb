require 'rails_helper'

RSpec.describe "Register", type: :feature do
  before :each do
  end
  
  describe "monster page should show a list of all monsters from api" do
    it "also includes a link to further information (if needed)" do
      VCR.use_cassette('monster_list') do
        visit monsters_path

        expect(page).to have_content("List of Monsters")
        expect(page).to have_content("Monster Name")
        expect(page).to have_content("Link to More API Data")
        expect(page).to have_content("Aboleth")
        expect(page).to have_content("Acolyte")
        expect(page).to have_content("Adult Black Dragon")
        expect(page).to have_content("Adult Blue Dragon")
        expect(page).to have_content("Adult Bronze Dragon")
      end
    end
  end
end