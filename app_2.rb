require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@player1
@player2
@human
@enemies = []

# This method return just a message at the begining of the game
def welcome_message
  puts "------------------------------------------------"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end

# This method ask the user pseudo and keep it in the @human variable
def create_human_player
  puts "Quel est ton pseudo humain ?"
  print ">"
  return @human = HumanPlayer.new(gets.chomp)
end

# This method create the 2 user "Josiane" and "José" and put it into an array
def create_comput_user
  @player1 = Player.new("Josiane")
  @player2 = Player.new("José")
  @enemies << @player1
  @enemies << @player2
end

# This boucle work until an user or a computer player is dead
def fight
  while @human.life_points > 0 && (@player1.life_points > 0 || @player1.life_points >0)
    puts "\n"
    puts "Que veux-tu faire ?"
    print "> "
    action = gets.chomp.to_s

    if action == "a" # if 'a' get a weapon
      @human.search_weapon
    elsif action == "s" # if 's' get a health pack
      @human.search_health_pack
    elsif action == "0" # if '0' user attaks 'Josiane'
      @human.attacks (@player1)
    elsif action == "1" # if '1' user attaks 'José'
      @human.attacks (@player2)
    elsif action == "2" # if '2' 'Josiane' and 'José' attak user
      puts "Les autres joueurs t'attaquent !"
      @enemies.each { |i| i.life_points <= 0 ? break : i.attacks(@human) }
      @human.show_state

    # If enter a wrong number puts information tu user screen
    else
      puts "______________ Tu as pas entré la bonne valeur _______________"
      puts "--- Entre 'a' pour partir à la recherche d'une arme-----------"
      puts "--- Entre 's' pour partir à la recherche  d'un pack de soin---"
      puts "--- Entre '0' pour attaquer Josiane --------------------------"
      puts "--- Entre '1' pour attaquer José -----------------------------"
      puts "--- Entre '2' pour se faire attaquer par Josiane et José -----"
    end
  end

  puts "La partie est finie"
  puts "BRAVO ! TU AS GAGNE !"
end

def perform
  welcome_message
  create_human_player
  create_comput_user
  fight
end

perform
