class MonstersController < ApplicationController
  def index
    @monsters = EncounterSimFacade.new
  end
end