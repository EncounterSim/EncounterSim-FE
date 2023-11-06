class Results
  attr_reader :sim_id, :total_wins, :total_losses, :total_rounds,
              :win_percentage, :p1_dmg, :p2_dmg, :p3_dmg, :p4_dmg, :p5_dmg

  def initialize(data)
    @sim_id = data[:id]
    @total_wins = data[:total_wins]
    @total_losses = data[:total_loses]
    @total_rounds = data[:total_rounds]
    @win_percentage = data[:win_percentage]
    @p1_dmg = data[:p1_stats][:avg_dmg]
    @p2_dmg = data[:p2_stats][:avg_dmg]
    @p3_dmg = data[:p3_stats][:avg_dmg]
    @p4_dmg = data[:p4_stats][:avg_dmg]
    @p5_dmg = data[:p5_stats][:avg_dmg]
  end
end