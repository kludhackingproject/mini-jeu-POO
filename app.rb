require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def fight (player1, player2)

  # Attacks continue if the 2 users style has life point
  while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state

    # Attack with the player1 (player1 start)
    puts "Passons à la phase d'attaque pour #{player1.name} :"
    player1.attacks (player2)

    # If player2 is dead with the player1 attack, while boucle stop
    if player2.life_points <= 0
      break
    end

    # Attack with the player2
    puts "Passons à la phase d'attaque pour #{player2.name} :"
    player2.attacks (player1)

    # If player1 is dead with the player2 attack, while boucle stop
    if player2.life_points <= 0
      break
    end
    puts "\n"
    puts "------------"
    puts "\n"
  end
end

def perform
  player1 = Player.new("Josiane")
  player2 = Player.new("José")
  fight(player1, player2)
end

perform
