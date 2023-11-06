class EncounterSimFacade
  def initialize
    @service = EncounterSimService.new
  end

  def monster_list
    list = @service.monsters.map do |monster|
      Monster.new(monster)
    end
  end

  def player_list
    @service.players.map do |player|
      Player.new(player)
    end
  end

  def spell_list
    @service.spells.map do |spell|
      Spell.new(spell)
    end
  end

  def monster(monster_index)
    monster = @service.monster(monster_index)[:data][:attributes]
    ShowMonster.new(monster)
  end

  def encounter_results(id)
    results = @service.encounter_results(id)
    Results.new(results[:data][:attributes])
  end

  def encounters(id)
    results = @service.encounters(id)
    require 'pry';binding.pry
  end

  def spell_names
    list = spell_list.map do |spell|
      spell.name
    end
  end

  def monster_names
    monster_list.map do |monster|
      monster.name
    end
  end
  
  def player_classes
    player_list.map do |player|
      player.name
    end
  end

  def levels
    (1..20).to_a
  end

  def ability_modifiers
    (-5..5).to_a
  end

  def armor_class
    (10..30).to_a
  end

  def damage_die_1
    (1..4).to_a
  end

  def damage_die_2
    ['d4','d6','d8', 'd10', 'd12']
  end

  def new_encounter(params)
    hash = {
      user_id: params[:id],
      monster: params[:monster],
      characters: [params[:char1], params[:char2], params[:char3], params[:char4], params[:char5]]
    }
    data = EncounterSimService.new.encounter_creation(hash)
    Results.new(data[:data][:attributes])
  end
end