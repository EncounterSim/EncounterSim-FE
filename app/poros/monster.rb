class Monster
  attr_reader :id, :name, :url
  def initialize(monster_info)
    @id = monster_info[:id]
    @name = monster_info[:attributes][:name]
    @url = monster_info[:attributes][:url]
  end
end