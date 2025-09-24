require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human'

puts '------------------------------------------'
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO !'"
puts '------------------------------------------'
print 'Quel est ton nom jeune aventurier ?'
human_name = gets.chomp.to_s
humanplayer = HumanPlayer.new(human_name)
player1 = Player.new('Josiane')
player2 = Player.new('José')
enemies = [player1, player2]

tour = 1
while humanplayer.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

  puts "--- Manche #{tour} ---"
  humanplayer.show_state

  puts '> Que souhaites-tu faire ?'
  puts 'a - chercher une meilleure arme'
  puts 's - chercher à se soigner'
  puts 'attaquer un joueur en vue :'
  puts ''
  player1.show_state
  puts '0 pour attaquer Josiane'
  puts ''
  player2.show_state
  puts '1 pour attaquer José'
  puts ''

  choice = gets.chomp
  if choice == 'a'
    humanplayer.search_weapon
  elsif choice == 's'
    humanplayer.search_health_pack
  elsif choice == '0'
    humanplayer.human_attacks(player1)
  elsif choice == '1'
    humanplayer.human_attacks(player2)
  end
  puts ''
  enemies.each do |enemy|
    puts "Les autres joueurs t'attaquent !"
    enemy.attacks(humanplayer) if enemy.life_points > 0
  end

  tour += 1
end

puts 'La partie est finie'
puts humanplayer.life_points > 0 ? 'BRAVO ! TU AS GAGNÉ !' : 'Loser ! Tu as perdu !'
