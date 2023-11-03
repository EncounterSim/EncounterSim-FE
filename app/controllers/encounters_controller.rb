class EncountersController < ApplicationController
  def new
    @encounter = EncounterSimFacade.new
  end

  def create
    @new_encounter = EncounterSimFacade.new.new_encounter(params)
  end

  private
  # def encounter_params
  #   params.permit(:monster, :class_1, :level_1, :ability_modifiers_1, :class_2, :level_2, :ability_modifiers_2, :class_2, :level_2, :ability_modifiers_2, :class_3, :level_3, :ability_modifiers_3, :class_4, :level_4, :ability_modifiers_4, :class_5, :level_5, :ability_modifiers_5, :class_6, :level_6, :ability_modifiers_6)
  # end
end