class Encounter
  def initialize(params)
    @monster = params[:monster]
    @class_1 = params[:class_1]
    @level_1 = params[:level_1]
    @strength_1 = params[:strength_1]
    @dexterity_1 = params[:dexterity_1]
    @constitution_1 = params[:constitution_1]
    @wisdom_1 = params[:wisdom_1]
    @charisma_1 = params[:charisma_1]
    @intelligence_1 = params[:intelligence_1]
    @spell1_1 = params[:spell1_1]
    @spell2_1 = params[:spell2_1]
    @spell3_1 = params[:spell3_1]
    @hit_points_1 = params[:hit_points_1]
    @armor_class_1 = params[:armor_class_1]
    @damage_die1_1 = params[:damage_die1_1]
    @damage_die2_1 = params[:damage_die2_1]

    @class_2 = params[:class_2]
    @level_2 = params[:level_2]
    @strength_2 = params[:strength_2]
    @dexterity_2 = params[:dexterity_2]
    @constitution_2 = params[:constitution_2]
    @wisdom_2 = params[:wisdom_2]
    @charisma_2 = params[:charisma_2]
    @intelligence_2 = params[:intelligence_2]
    @spell1_2 = params[:spell1_2]
    @spell2_2 = params[:spell2_2]
    @spell3_2 = params[:spell3_2]
    @hit_points_2 = params[:hit_points_2]
    @armor_class_2 = params[:armor_class_2]
    @damage_die1_2 = params[:damage_die1_2]
    @damage_die2_2 = params[:damage_die2_2]

    @class_2 = params[:class_2]
    @level_2 = params[:level_2]
    @strength_2 = params[:strength_2]
    @dexterity_2 = params[:dexterity_2]
    @constitution_2 = params[:constitution_2]
    @wisdom_2 = params[:wisdom_2]
    @charisma_2 = params[:charisma_2]
    @intelligence_2 = params[:intelligence_2]
    @spell1_2 = params[:spell1_2]
    @spell2_2 = params[:spell2_2]
    @spell3_2 = params[:spell3_2]
    @hit_points_2 = params[:hit_points_2]
    @armor_class_2 = params[:armor_class_2]
    @damage_die1_2 = params[:damage_die1_2]
    @damage_die2_2 = params[:damage_die2_2]

    @class_3 = params[:class_3]
    @level_3 = params[:level_3]
    @strength_3 = params[:strength_3]
    @dexterity_3 = params[:dexterity_3]
    @constitution_3 = params[:constitution_3]
    @wisdom_3 = params[:wisdom_3]
    @charisma_3 = params[:charisma_3]
    @intelligence_3 = params[:intelligence_3]
    @spell1_3 = params[:spell1_3]
    @spell2_3 = params[:spell2_3]
    @spell3_3 = params[:spell3_3]
    @hit_points_3 = params[:hit_points_3]
    @armor_class_3 = params[:armor_class_3]
    @damage_die1_3 = params[:damage_die1_3]
    @damage_die2_3 = params[:damage_die2_3]

    @class_4 = params[:class_4]
    @level_4 = params[:level_4]
    @strength_4 = params[:strength_4]
    @dexterity_4 = params[:dexterity_4]
    @constitution_4 = params[:constitution_4]
    @wisdom_4 = params[:wisdom_4]
    @charisma_4 = params[:charisma_4]
    @intelligence_4 = params[:intelligence_4]
    @spell1_4 = params[:spell1_4]
    @spell2_4 = params[:spell2_4]
    @spell3_4 = params[:spell3_4]
    @hit_points_4 = params[:hit_points_4]
    @armor_class_4 = params[:armor_class_4]
    @damage_die1_4 = params[:damage_die1_4]
    @damage_die2_4 = params[:damage_die2_4]

    @class_5 = params[:class_5]
    @level_5 = params[:level_5]
    @strength_5 = params[:strength_5]
    @dexterity_5 = params[:dexterity_5]
    @constitution_5 = params[:constitution_5]
    @wisdom_5 = params[:wisdom_5]
    @charisma_5 = params[:charisma_5]
    @intelligence_5 = params[:intelligence_5]
    @spell1_5 = params[:spell1_5]
    @spell2_5 = params[:spell2_5]
    @spell3_5 = params[:spell3_5]
    @hit_points_5 = params[:hit_points_5]
    @armor_class_5 = params[:armor_class_5]
    @damage_die1_5 = params[:damage_die1_5]
    @damage_die2_5 = params[:damage_die2_5]
  end

  def encounter_hash_creation
    {
        monster: @monster,
        class_1: @class_1, 
        level_1: @level_1,
        strength_1: @strength_1,
        dexterity_1: @dexterity_1,
        constitution_1: @constitution_1, 
        wisdom_1: @wisdom_1,
        charisma_1: @charisma_1,
        intelligence_1: @intelligence_1, 
        spell1_1: @spell1_1, 
        spell2_1: @spell2_1,
        spell3_1: @spell3_1,
        hit_points_1: @hit_points_1,
        armor_class_1: @armor_class_1, 
        damage_die1_1: @damage_die1_1, 
        damage_die2_1: @damage_die2_1,
        class_2: @class_2, 
        level_2: @level_2,
        strength_2: @strength_2,
        dexterity_2: @dexterity_2,
        constitution_2: @constitution_2, 
        wisdom_2: @wisdom_2,
        charisma_2: @charisma_2,
        intelligence_2: @intelligence_2, 
        spell1_2: @spell1_2, 
        spell2_2: @spell2_2,
        spell3_2: @spell3_2,
        hit_points_2: @hit_points_2,
        armor_class_2: @armor_class_2, 
        damage_die1_2: @damage_die1_2, 
        damage_die2_2: @damage_die2_2,
        class_3: @class_3, 
        level_3: @level_3,
        strength_3: @strength_3,
        dexterity_3: @dexterity_3,
        constitution_3: @constitution_3, 
        wisdom_3: @wisdom_3,
        charisma_3: @charisma_3,
        intelligence_3: @intelligence_3, 
        spell1_3: @spell1_3, 
        spell2_3: @spell2_3,
        spell3_3: @spell3_3,
        hit_points_3: @hit_points_3,
        armor_class_3: @armor_class_3, 
        damage_die1_3: @damage_die1_3, 
        damage_die2_3: @damage_die2_3, 
        class_4: @class_4, 
        level_4: @level_4,
        strength_4: @strength_4,
        dexterity_4: @dexterity_4,
        constitution_4: @constitution_4, 
        wisdom_4: @wisdom_4,
        charisma_4: @charisma_4,
        intelligence_4: @intelligence_4, 
        spell1_4: @spell1_4, 
        spell2_4: @spell2_4,
        spell3_4: @spell3_4,
        hit_points_4: @hit_points_4,
        armor_class_4: @armor_class_4, 
        damage_die1_4: @damage_die1_4, 
        damage_die2_4: @damage_die2_4, 
        class_5: @class_5, 
        level_5: @level_5,
        strength_5: @strength_5,
        dexterity_5: @dexterity_5,
        constitution_5: @constitution_5, 
        wisdom_5: @wisdom_5,
        charisma_5: @charisma_5,
        intelligence_5: @intelligence_5, 
        spell1_5: @spell1_5, 
        spell2_5: @spell2_5,
        spell3_5: @spell3_5,
        hit_points_5: @hit_points_5,
        armor_class_5: @armor_class_5, 
        damage_die1_5: @damage_die1_5, 
        damage_die2_5: @damage_die2_5
    }
  end
end