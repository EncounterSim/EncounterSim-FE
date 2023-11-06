class Results
  attr_reader :sim_id, :total_wins, :total_losses, :total_rounds,
              :win_percentage

  def initialize(data)
    @sim_id = data[:id]
    @total_wins = data[:total_wins]
    @total_losses = data[:total_loses]
    @total_rounds = data[:total_rounds]
    @win_percentage = data[:win_percentage]
  end
end