module UsersHelper
  def new_stat!(user)
    user.health = 100
    user.alcohol = 0
    user.happy = 0
    user.tired = 0
    user.money = 300
  end

  def stats_update(action_effect, user)
    updated_stat = { 'health' => 0, 'alcohol' => 0, 'happy' => 0, 'tired' => 0, 'money' => 0 }
    updated_stat.each { |key, _value| updated_stat[key] = action_effect[key].to_i + user[key] }
    updated_stat
  end

  def select_effects!(conds, action_effect, user)
    conds.each do |cond|
      action_effect[cond.attr_name_eff] = cond.value_eff if (cond.attr_name_eff != 'none') && cond_is_true?(cond,
                                                                                                            user)
    end
  end

  def cond_is_true?(condition, user)
    user[condition.attr_name].between?(condition.min, condition.max) unless condition.nil?
  end

  def dead?(user)
    user.health.zero? || user.happy == -10 || user.money <= -100 || user.tired == 100
  end

  def validate_stats!(stats, user)
    stats['health'] = valid_health(stats['health'])
    stats['alcohol'] = valid_alcohol(stats['alcohol'], user)
    stats['happy'] = valid_happy(stats['happy'])
    stats['tired'] = valid_tired(stats['tired'])
  end

  def valid_health(health)
    validate(health, 0, 100)
  end

  def valid_alcohol(alcohol, user)
    user.health -= validate(user.alcohol - alcohol, 0, user.health) if user.alcohol < alcohol.abs
    validate(alcohol, 0, 100)
  end

  def valid_happy(happy)
    validate(happy, -10, 10)
  end

  def valid_tired(tired)
    validate(tired, 0, 100)
  end

  def validate(value, min, max)
    [[value, max].min, min].max
  end
end
