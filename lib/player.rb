class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @life_points = 10
    @name = name

  end


  def show_state
    puts "#{@name} a #{@life_points} points de vies"
  end


  def gets_damage(damages)
    @life_points -= damages

    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
      
      if @life_points < 0
        @life_points = 0
      end
    else
      puts "#{@name} a #{@life_points} points de vie "
    end

  end


  def attacks(player)

    puts "#{@name} attaque le joueur #{player.name}"
    damages = compute_damage
    puts "Il lui inflige #{damages} points de dommages"
    player.gets_damage(damages)  
  end


  def compute_damage
    return rand(1..6)
  end

end



class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end


  def show_state
    puts "#{name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end


  def compute_damage
    rand(1..6) * @weapon_level
  end


  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"

    if @weapon_level < new_weapon
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end


  def search_health_pack
    dice = rand(1..6)

    if dice == 1
      puts "Tu n'as rien trouvé..."
    elsif dice >= 2 && dice <= 5
      @life_points += 50
      @life_points = life_points > 100 ? life_points = 100 : life_points
      puts "Bravo tu as trouvé un pack de +50 points de vie!"
    else
      @life_points += 80
      @life_points = life_points > 100 ? life_points = 100 : life_points
      puts "Waow, tu as trouvé un pack de +80 points de vie!"
    end
  end
      


end