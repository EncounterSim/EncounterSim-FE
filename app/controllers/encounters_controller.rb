class EncountersController < ApplicationController
  def new
    @monsters = EncounterSimFacade.new.monster_names
  end

  def create
  end
end