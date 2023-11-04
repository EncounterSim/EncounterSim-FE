class ShowMonster
  attr_reader :name, :armor_class, :hit_points, :damage_dice,
              :strength, :dexterity, :constitution, :intelligence,
              :wisdom, :charisma, :attacks, :id

  def initialize(data)
    @id = nil
    @name = data[:name]    
    @armor_class = data[:armor_class]
    @hit_points = data[:hit_points]    
    @strength = data[:strength]    
    @dexterity = data[:dexterity]    
    @constitution = data[:constitution]    
    @intelligence = data[:intelligence]    
    @wisdom = data[:wisdom]    
    @charisma = data[:charisma]

    @attacks = data[:attacks]
  end
end