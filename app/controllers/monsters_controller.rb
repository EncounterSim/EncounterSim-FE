class MonstersController < ApplicationController
  def index
    @monsters = EncounterSimFacade.new
  end

  def show
    @monster = EncounterSimFacade.new.monster(params[:id])
  end
end