class Player

attr_accessor :name, :life_points

def initialize(name)
  @name = name
  @life_points = 10
end

def show_state
  puts "#{@name} a #{@life_points} points de vie"
end

def get_damage(damage_infliged)
  @life_points = @life_points - damage_infliged
  if @life_points <=0
    puts "Le joueur #{@name} a été tué !"
  end
end

def attacks(player)
  puts "Le joueur #{@name} attaque #{player.name}"
  damage_infliged = compute_damage.to_i
  puts "Il lui a infligé #{damage_infliged} points de dommages "
  player.get_damage(damage_infliged)
end

def compute_damage
  return rand(1..6)
end

end

class HumainPlayer < Player

attr_accessor :weapon_level

def initialize(name)
  super name
  @life_points = 100
  @weapon_level = 1
end

def show_state
  puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
end

def compute_damage
    rand(1..6) * @weapon_level
  end

def search_weapon
  wp_lvl = rand(1..6)
  puts "Tu as trouvé une arme de niveau #{wp_lvl}"
  if wp_lvl > @weapon_level
    @weapon_level = wp_lvl
    puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
  else
    puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
  end
end

def search_health_pack
  health_lvl = rand(1..6)
  if health_lvl == 1
    puts "Tu n'as rien trouvé... "
  elsif health_lvl >= 2 && health_lvl <= 5
    puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    if @life_points > 50
      @life_points == 100
    else
      @life_points = @life_points + 50
    end
  elsif health_lvl > 5
    puts "Waow, tu as trouvé un pack de +80 points de vie !"
    if @life_points > 20
      @life_points == 100
    else
      @life_points = @life_points + 80
    end
  end
end
end
