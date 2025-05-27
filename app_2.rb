require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'


puts "-------------------------------------------------"
puts "|Bienvenue sur 'LA POO DUR' !                   |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "\nQuel est ton prénom joueur à la POO dur ?"
print "> "
name = gets.chomp
user = HumanPlayer.new(name)
puts "Bien reçu! Il est temps pour l'aPOOcalypse, #{name} est dans la place !"

ennemies = []
player1 = Player.new("josianne")
player2 = Player.new("josé")
ennemies << player1
ennemies << player2

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "\nVoici l'état du joueur :"
  user.show_state
  choice = ""

  while choice != "a" && choice != "s" && choice != "0" && choice != "1"
    puts "\nQuelle action veux-tu effectuer ?" 
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "Attaquer un joueur en vue :"
    print "0 - " 
    player1.show_state
    print "1 - "
    player2.show_state
    print "> "
    choice = gets.chomp.downcase
    

    case choice
    when "a"
      user.search_weapon
      sleep 1
    when "s"
      user.search_health_pack
      sleep 1
    when "0"
      user.attacks(player1)
      sleep 1
    when "1"
      user.attacks(player2)
      sleep 1
    else
      puts "J'ai POO compris..."
      sleep 1
      next
    end

    puts "Les ennemis riPOOstent !"

    ennemies.each do  |ennemy| 
      if ennemy.life_points > 0 && user.life_points > 0
        ennemy.attacks(user)
      end
    end

  end

end

puts "La partie est finie"

if user.life_points > 0
  puts "BRAVO ! TU AS GAGNÉ ! TU AS TROP DE POO-WER !"
else
  puts "Perdu ! Appelez la POOlice, #{user.name} est en pls!"
end
