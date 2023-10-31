class EncounterSimService

  def encounters
    get_url("")
  end

  def monsters
    get_url("")
  end

  def users
    get_url("")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_name: true)
  end

  def conn
    Faraday.new(url: 'http://localhost:5000')
  end
end