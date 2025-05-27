require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

def perform

  name = Game.intro

  my_game = Game.new(name)
  puts "Bien reçu! C'est l'aPOOcalypse, #{name} est dans la place !"

  while my_game.is_still_ongoing?

    my_game.show_players
    my_game.new_players_in_sight
    my_game.menu
    print "> "
    choice = gets.chomp.downcase
    my_game.menu_choice(choice)
    my_game.ennemies_attack

  end

  my_game.end
end

perform