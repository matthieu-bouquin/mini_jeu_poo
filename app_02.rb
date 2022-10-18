require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------"
puts "|     QUI VEUT LA POO DE MON CREW!?     |"
puts "|       le dernier sera premier!        |"
puts "----------------------------------------"

puts"choisi ton blaze"
print ">"
name_player = gets.chomp

user = HumanPlayer.new(name_player)

enemies = []
player1 = Player.new("Jozy")
player2 = Player.new("José")
enemies << Player.new("")


while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

    puts "voici ton etat:" 
    puts "#{user.show_state}"
    puts ""
    puts "quelle action veux tu effectuer ?"
    puts "a - chercher une meilleur arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "attaquer un joueur en vue:"
    puts "0 - #{player1.show_state}"
    puts "1 - #{player2.show_state}"


    input = gets.chomp
    case input
        when "a"
            user.search_weapon
        when "s" 
            user.search_health_pack
        when "0"
            user.attacks(player1)
        when "1"
            user.attacks(player2)
        else
            "c'est quand meme pas compliqué"
    end
 
    gets.chomp

    puts ""
    puts "les autres joueurs t'attaquent!"
    enemies.each {|enemies| enemies.attacks(user) if enemies.life_points > 0}

    if user.life_points > 0 
        then "  █░░█ █▀▀█ █░░█ 　 █░░░█ ░▀░ █▀▀▄ 
                █▄▄█ █░░█ █░░█ 　 █▄█▄█ ▀█▀ █░░█ 
                ▄▄▄█ ▀▀▀▀ ░▀▀▀ 　 ░▀░▀░ ▀▀▀ ▀░░▀" 

    else puts " █░░░█ █▀▀█ █▀▀ ▀▀█▀▀ █▀▀ █▀▀▄ 
                █▄█▄█ █▄▄█ ▀▀█ ░░█░░ █▀▀ █░░█ 
                ░▀░▀░ ▀░░▀ ▀▀▀ ░░▀░░ ▀▀▀ ▀▀▀░"
end

end



