class Game
  attr_accessor :human_player, :players_left, :ennemies_in_sight

  def initialize(name)

    @players_left = 10
    @ennemies_in_sight = []
    @human_player = HumanPlayer.new(name)

    # for i in [1..4]
    #   player = Player.new("joueur#{i}")
    #   @ennemies_ << player
    # end

  end



  def kill_player(player)

    @ennemies_in_sight.reject! {|ennemy| ennemy == player}
    @players_left -= 1

  end



  def is_still_ongoing?

    if @players_left > 0  && @human_player.life_points > 0
      return true
    else
      return false
    end

  end


  def show_players

    @human_player.show_state
    puts "Il reste #{@players_left} ennemis à vaincre"
    sleep 1
  end


  def menu

    # while choice != "a" && choice != "s" && choice < 0 && choice > @ennemies.length
    puts "\n-----------------------------------"
    puts "Quelle action veux-tu effectuer ?" 
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"

    if @ennemies_in_sight.size > 0
      puts "Attaquer un joueur en vue :"
      @ennemies_in_sight.each_with_index do |ennemy, index|
        print "#{index} - "
        ennemy.show_state
      end
    else
      puts "-----------------------------"
      puts "Il n'y a pas d'ennemis en vue"
    end

  end


  def menu_choice(choice)

    case choice
    when "a"
      @human_player.search_weapon
      sleep 1
    when "s"
      @human_player.search_health_pack
      sleep 1
    else
      index = choice.to_i

      if index >= 0 && index <= @ennemies_in_sight.length
        ennemy = @ennemies_in_sight[index]
        @human_player.attacks(ennemy)
        sleep 1
        if ennemy.life_points == 0
          kill_player(ennemy)
        end
      else
        puts "J'ai POO compris..."
        sleep 1
      end
    end
  end


  def ennemies_attack

    puts "Les ennemis riPOOstent !"
    @ennemies_in_sight.each {|ennemy| ennemy.attacks(human_player)}

  end


  def end

    puts "\nLa partie est finie"

    if @human_player.life_points > 0
      puts "\nBRAVO ! TU AS GAGNÉ ! TU AS TROP DE POO-WER !"
    else
      puts "\nPerdu ! Appelez la POOlice, #{user.name} est en pls!"
    end

  end



  def new_players_in_sight

    if @players_left > 0

      if @ennemies_in_sight.length == @players_left
        puts "\nTout les joueurs sont déjà en vue"
      else
        dice = rand(1..6)

        if dice == 1
          
          puts "\nAucun nouveau joueur adverse n'arrive"

        elsif dice >= 2 && dice <=4
        
          random_name = "joueur#{rand(1..1000)}"
          player = Player.new(random_name)
          @ennemies_in_sight << player
          puts "\nUn nouvel adversaire est en vue"

        else

          if @players_left == 1
            player = Player.new("joueur#{rand(1..1000)}")
            @ennemies_in_sight << player
            puts "\nUn nouvel et dernier adversaire est en vue"
          else
            2.times do
              player = Player.new("joueur#{rand(1..1000)}")
              @ennemies_in_sight <<  player
            end
            puts "\nDeux nouveaux adversaires sont en vue"
          end

        end
      end
    end
  end

end