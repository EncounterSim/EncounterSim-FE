class Combat
  attr_reader :p1, :p2, :p3, :p4, :p4, :monster
  def initialize(data)
    @p1 = data[:p1]
    @p2 = data[:p2]
    @p3 = data[:p3]
    @p4 = data[:p4]
    @p5 = data[:p5]
    @monster = data[:monster]
  end

  def players
    "#{@p1} #{@p2} #{@p3} #{@p4} #{@p5} #{@monster}"
  end
end