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

  def spells
    @service.spells.map do |spell|
      Spell.new(spell)
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
end