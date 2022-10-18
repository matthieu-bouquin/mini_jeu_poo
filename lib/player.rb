require "pry"

class Player
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end

    def show_state
        puts "#{@name} a #{@life_points} point de vie"
    end

    def gets_damage(damage)
        @life_points = life_points - damage
        puts "inflige #{damage} points de dommages"
        if @life_points <= 0
            puts " #{@name} est K.O."
        end
    end

    def attacks(player)
        
        damage = compute_damage
        player.gets_damage(damage)
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts"#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand (1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon}"
        
        if new_weapon > @weapon_level
            then @weapon_level = new_weapon
            puts "arme ameliorée"
        
        else 
            puts "pas besoin de ça"
        end
    end

    def search_health_pack
        new_health_pack = rand (1..6)

        if new_health_pack == 1 
            puts "rien trouvé, pas d poo"

        elsif new_health_pack < 6 
            then @life_points = life_points + 50
            puts " t'as trouvé 50 point de vie"
            if @life_points > 100
                then @life_points = 100
            end

        else @life_points = life_points + 80
            puts " t'as trouvé 80 point de vie"
            if @life_points > 100
                then @life_points = 100  
            end
        end
    end
end
