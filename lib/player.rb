class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{name} à #{life_points} points de vie !"
  end

  def gets_damage
    @life_points = life_points - compute_damage
    show_state
    return unless @life_points <= 0

    puts "Le joueur #{name} a été tué !"
  end

  def attacks(player)
    puts "Le joueur #{@name} vient d'attaquer le joueur #{player.name},"
    player.gets_damage
    #    player.gets_damage(compute_damage)
    #    puts "Le joueur #{@name} vient d'attaquer le joueur #{player.name} et de lui retirer #{compute_damage}, il lui reste #{player.life_points} points de vies !"
  end

  def compute_damage
    rand(1..6)
  end
end
