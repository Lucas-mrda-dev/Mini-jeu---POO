require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Josiane')
player2 = Player.new('José')

tour = 1
while player1.life_points > 0 && player2.life_points > 0
  puts "--- Manche #{tour} ---"
  puts "#{player1.show_state}  #{player2.show_state}"
  player1.attacks(player2)
  break if player2.life_points <= 0

  player2.attacks(player1)
  tour += 1
end

binding.pry
