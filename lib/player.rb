
class Player
  attr_accessor :name, :life_points

  # Initialise a new player with his name and 10 life points
  def initialize (name)
    @name = name
    @life_points = 10
  end

  # Show the life point of the current user
  def show_state
    if @life_points <= 0
      puts ">>> #{@name} a 0 points de vie"
    else
      puts ">>> #{@name} a #{@life_points} points de vie"
    end
  end

  # Give damage to the curent user
  def gets_damage(damage)
    @life_points = @life_points - damage

    # If the user has 0 life point it show a message that he loose
    if @life_points <= 0
      puts "\n"
      puts "----- La partie est finie #{self.name} a perdu ! -----"
    end
  end

  # Give attacks from the current player to an other (in "player" argument)
  def attacks (player)
    damage = compute_damage

    puts ">>> Le joueur #{self.name} attaque le joueur #{player.name}"

    puts ">>> Il lui inflige #{damage} points de dommages"

    # Give damages to the "player" in argument
    player.gets_damage(damage)
  end

  # Give random number to use in gets_damage function
  def compute_damage
    rand(1..6)
  end
end



class HumanPlayer < Player
  attr_accessor :weapon_level
  attr_accessor :compute_damage_rand

  def initialize (name)
    super(name)

    @life_points = 100
    @weapon_level = 1
  end

  # Show the life point and weapon level of the current user
  def show_state
    if @life_points <= 0
      puts ">>> #{@name} a 0 points de vie"
    else
      puts ">>> #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end
  end

  # Give damage to enemies
  def compute_damage
    super * @weapon_level
  end

  # Get a new weapon
  def search_weapon
    new_weapon = rand(1..6)
    puts ">>> Tu as trouvé une arme de niveau #{new_weapon}"

    # Get a random value for the weapon. If the actual weapon has more power, keep the value
    # if it's lower it change the value to the best weapon value
    if new_weapon > @weapon_level
      puts ">>> Cette arme est plus puissante !"
      @weapon_level = new_weapon
    else
      puts ">>> Cette arme est moins puissante !"
    end
  end

  # Get a health pack to user life_points
  def search_health_pack
    new_health_pack = rand(1..6)

    if new_health_pack == 1
      puts ">>> Tu n'as rien trouvé..."

    elsif new_health_pack >= 2 && new_health_pack <= 5
      puts ">>> Bravo, tu as trouvé un pack de +50 points de vie !"

      # If it get +50 points pack and value is >= 50 it return 100 points
      if @life_points >= 50
        @life_points = 100
      # If it get +50 points pack and value is < 50 it return the actual life_points + 50 points
      else
        @life_points = @life_points + 50
      end
    # Same as the +50 points pack
    else
      puts ">>> Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points >= 20
        @life_points = 100
      else
        @life_points = @life_points + 80
      end
    end
  end
end
