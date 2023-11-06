class Results
  attr_reader :sim_id, :total_wins, :total_losses

  def initialize(data)
    @sim_id = data[:id]
    @total_wins = data[:total_wins]
    @total_losses = data[:total_loses]
  end
end