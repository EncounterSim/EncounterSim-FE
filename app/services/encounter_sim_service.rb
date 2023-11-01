class EncounterSimService

  def spells
    get_url("/api/v1/spells")[:data]
  end

  def monsters
    get_url("/api/v1/monsters")[:data]
  end

  def players
    get_url("/api/v1/players")[:data]
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names:true)
  end

  def conn
    Faraday.new(url: 'http://localhost:3000')
  end
end