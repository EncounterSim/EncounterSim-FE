class MonstersController < ApplicationController
  def index
    monster_list = EncounterSimFacade.new.monster_list
    @monsters = Kaminari.paginate_array(monster_list).page(params[:page]).per(15)
    
  end

  def show
    @monster = EncounterSimFacade.new.monster(params[:id])
  end
end