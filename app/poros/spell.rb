class Spell
  attr_reader :name, :url
  def initialize(spell_info)
    @name = spell_info[:attributes][:name]
    @url = spell_info[:attributes][:url]
  end
end