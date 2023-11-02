require 'rails_helper'

RSpec.describe EncounterSimService do
  
  describe 'service methods' do
    describe "#spells" do
      it "returns spell information" do
        VCR.use_cassette('spell_list') do
          spell_info = EncounterSimService.new.spells

          expect(spell_info).to be_an Array
          expect(spell_info[0]).to be_a Hash
          expect(spell_info[0][:attributes]).to be_a Hash
          expect(spell_info[0][:attributes][:name]).to eq("Acid Arrow")
        end
      end
    end

    describe "#monsters" do
      it "returns monster information" do
        VCR.use_cassette('monster_list') do
          spell_info = EncounterSimService.new.monsters

          expect(spell_info).to be_an Array
          expect(spell_info[0]).to be_a Hash
          expect(spell_info[0][:attributes]).to be_a Hash
          expect(spell_info[0][:attributes][:name]).to eq("Aboleth")
        end
      end
    end

    describe "#players" do
      it "returns player information" do
        VCR.use_cassette('encounter_list') do
          spell_info = EncounterSimService.new.players

          expect(spell_info).to be_an Array
          expect(spell_info[0]).to be_a Hash
          expect(spell_info[0][:attributes]).to be_a Hash
          expect(spell_info[0][:attributes][:name]).to eq("Barbarian")
        end
      end
    end
  end
end