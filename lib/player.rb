
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
      puts "> #{@name} a 0 points de vie"
    else
      puts "> #{@name} a #{@life_points} points de vie"
    end
  end

  # Give damage to the curent user
  def gets_damage(damage)
    @life_points = @life_points - damage

    # If the user has 0 life point it show a message that he loose
    if @life_points <= 0
      puts "\n"
      puts ">>> La partie est finie #{self.name} a perdu ! <<<"
    end
  end

  # Give attacks from the current player to an other (in "player" argument)
  def attacks (player)
    damage = compute_damage

    puts "> Le joueur #{self.name} attaque le joueur #{player.name}"

    puts "> Il lui inflige #{damage} points de dommages"

    # Give damages to the "player" in argument
    player.gets_damage(damage)
  end

  # Give random number to use in gets_damage function
  def compute_damage
    return rand(1..6)
  end
end
