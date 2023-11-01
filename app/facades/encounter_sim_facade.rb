class EncounterSimFacade
  def initialize
    @service = EncounterSimService.new
  end

  def monster_list
    list = @service.monsters.map do |monster|
      Monster.new(monster)
    end
  end

  def players
    @services.players.map do |player|
      Player.new(player)
    end
  end

  def spells
    @services.spells.map do |spell|
      Spell.new(spell)
    end
  end

  def monster_names
    monster_list.map do |monster|
      monster.name
    end
  end
end