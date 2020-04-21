require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

print "-" * 49
print "\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
print "\n|Le but du jeu est d'être le dernier survivant !|" + "\n" + "-" * 49
puts ""

puts " Quelle est ton nom gueu !"
user = HumainPlayer.new(gets.chomp)

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1,player2]

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

  user.show_state

  puts "Quelle action veux-tu effectuer ?"

  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"

  puts "attaquer un joueur en vue :"

  puts "0 - #{player1.name} a #{player1.life_points}"
  puts "1 - #{player2.name} a #{player2.life_points}"
  puts " Quelle action veux-tu effectuer ?"

  user_choice = gets.chomp
  if user_choice == "a"
    user.search_weapon
  elsif user_choice == "s"
    user.search_health_pack
  elsif user_choice == "0"
    user.attacks(player1)
  elsif user_choice == "1"
    user.attacks(player2)
  else
    break
  end

  puts "Les autres joueurs t'attaquent !"

  enemies.each { |enemy| enemy.attacks(user)}
  puts ""

end



puts "La partie est finie"

if user.life_points > 0
  puts " BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
