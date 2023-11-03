class Player
  attr_reader :name, :url
  def initialize(player_info)
    @name = player_info[:attributes][:name]
    @url = player_info[:attributes][:url]
  end
end