class Results
  attr_reader :sim_id, :total_combats, :total_wins, :total_losses, :total_rounds,
              :win_percentage, :p1_stats, :p2_stats, :p3_stats, :p4_stats, :p5_stats,
              :monster_stats, :damage_per_combat, :player_death_tally, :avg_rounds

  def initialize(data)
    @sim_id = data[:id]
    @total_combats = data[:total_combats]
    @total_rounds = data[:total_rounds]
    @total_wins = data[:total_wins]
    @total_losses = data[:total_loses]
    @win_percentage = data[:win_percentage]
    @p1_stats = data[:p1_stats] if data[:p1_stats]
    @p2_stats = data[:p2_stats] if data[:p2_stats]
    @p3_stats = data[:p3_stats] if data[:p3_stats]
    @p4_stats = data[:p4_stats] if data[:p4_stats]
    @p5_stats = data[:p5_stats] if data[:p5_stats]
    @monster_stats = data[:monster_stats]

    @damage_per_combat = data[:damage_per_combat]
    @player_death_tally = data[:player_death_tally]
    @avg_rounds = data[:avg_rounds]
  end

  def sim_damage(p)
    @damage_per_combat[:"#{p}"][:total_damage].values.sum { |val| val.to_i }
  end

  def times_killed(player)
    @player_death_tally.count {|k| k[:"#{player}"] == true}
  end

  def total_deaths
    @player_death_tally.sum {|k| k.values.count {|k| k == true}}
  end

  def best_combat(p)
    @damage_per_combat[:"#{p}"][:total_damage].values.max
  end

  def worst_combat(p)
    @damage_per_combat[:"#{p}"][:total_damage].values.min
  end
end