

puts "-------------------------------------------------"
puts "|Bienvenue sur 'LA POO DUR' !                   |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "\nQuel est ton prénom joueur à la POO dur ?"
print "> "
name = gets.chomp
user = HumanPlayer.new(name)
my_game = Game.new(user)