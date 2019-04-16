require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@player1
@player2
@human
@enemies = []

def welcome_message
  puts "------------------------------------------------"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
end

def create_human_player
  puts "Quel est ton pseudo humain ?"
  print ">"
  return @human = HumanPlayer.new(gets.chomp)
end

def create_comput_user
  @player1 = Player.new("Josiane")
  @player2 = Player.new("José")
  @enemies << @player1
  @enemies << @player2
end

def fight
  while @human.life_points > 0 && (@player1.life_points > 0 || @player1.life_points >0)
    puts "\n"
    puts "Que veux-tu faire ?"
    print "> "
    action = gets.chomp.to_s
    if action == "a"
      @human.search_weapon
    elsif action == "s"
      @human.search_health_pack
    elsif action == "0"
      @human.attacks (@player1)
    elsif action == "1"
      @human.attacks (@player2)
    elsif action == "2"
      puts "Les autres joueurs t'attaquent !"
      @enemies.each { |i| i.life_points <= 0 ? break : i.attacks(@human) }
      @human.show_state
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

# Testing with pry
binding.pry
