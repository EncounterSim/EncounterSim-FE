class Results
  attr_reader :sim_id, :total_wins, :total_losses, :total_rounds,
              :win_percentage, :p1_stats, :p2_stats, :p3_stats, :p4_stats, :p5_stats,
              :total_combats, :p1_dmg_per_combat, :p2_dmg_per_combat, :p3_dmg_per_combat,
              :p4_dmg_per_combat, :p5_dmg_per_combat, :monster_avg_dmg, :monster_hit_rate

  def initialize(data)
    @sim_id = data[:id]
    @total_wins = data[:total_wins]
    @total_losses = data[:total_loses]
    @total_rounds = data[:total_rounds]
    @total_combats = data[:total_combats]
    @win_percentage = data[:win_percentage]
    @p1_stats = data[:p1_stats] if data[:p1_stats]
    @p2_stats = data[:p2_stats] if data[:p2_stats]
    @p3_stats = data[:p3_stats] if data[:p3_stats]
    @p4_stats = data[:p4_stats] if data[:p4_stats]
    @p5_stats = data[:p5_stats] if data[:p5_stats]
    
    @p1_dmg_per_combat = data[:damage_per_combat][:p1][:total_damage].values.sum
    @p2_dmg_per_combat = data[:damage_per_combat][:p2][:total_damage].values.sum
    @p3_dmg_per_combat = data[:damage_per_combat][:p3][:total_damage].values.sum
    @p4_dmg_per_combat = data[:damage_per_combat][:p4][:total_damage].values.sum
    @p5_dmg_per_combat = data[:damage_per_combat][:p5][:total_damage].values.sum

    @monster_avg_dmg = data[:monster_stats][:avg_dmg]
    @monster_hit_rate = data[:monster_stats][:hit_rate]
  end
end