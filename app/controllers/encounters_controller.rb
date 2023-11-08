class EncountersController < ApplicationController
  before_action :require_login

  def new
    @encounter = EncounterSimFacade.new
    @monsters = @encounter.monster_names
    @spells = @encounter.spell_names
    @players = @encounter.player_classes
  end

  def create
    params[:id] = session[:user_id]
    @new_encounter = EncounterSimFacade.new.new_encounter(params)
    redirect_to "/encounters/#{@new_encounter.sim_id}"
  end
  
  def show 
    @encounter = EncounterSimFacade.new.encounter_results(params[:id])
  end

  def index
    @facade = EncounterSimFacade.new
    @encounters = @facade.encounters(session[:user_id])
  end

  private

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end