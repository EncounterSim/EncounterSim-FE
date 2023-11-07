class MonstersController < ApplicationController
  def index
    monster_list = EncounterSimFacade.new.monster_list
    @monsters = Kaminari.paginate_array(monster_list).page(params[:page]).per(15)
    @page = params[:page]
  end

  def show
    @previous_page = params[:page]
    @monster = EncounterSimFacade.new.monster(params[:id])
  end
end