class HumanPlayer < Player
  attr_accessor :weapon_level, :HumanPlayerArray

  @@HumanPlayerArray = []

  def self.all
    @@HumanPlayerArray
  end

  def initialize(name)
    super(name)         # appelle l'initialize de Player pour gérer @name
    @life_points = 100  # écrase les 10 hp pour en donner 100
    @weapon_level = 1   # nouvel attribut
    @@HumanPlayerArray << self
  end

  def show_state
    puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level} !"
  end

  def search_weapon
    weapon_found = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_found}"
    if weapon_found > @weapon_level
      puts 'Youhou ! elle est meilleure : tu la prends !'
      @weapon_level = weapon_found
    else
      puts "Shit ! c'est de la merde : hop on jete !"
    end
  end

  def human_attacks(player)
    puts "Le joueur #{@name} vient d'attaquer le joueur #{player.name},"
    player.gets_damage_app_2
    #    player.gets_damage(compute_damage)
    #    puts "Le joueur #{@name} vient d'attaquer le joueur #{player.name} et de lui retirer #{compute_damage}, il lui reste #{player.life_points} points de vies !"
  end

  def gets_damage_player
    @life_points -= compute_damage2
    show_state
    @life_points = 0 if @life_points <= 0
    return unless @life_points <= 0

    puts "Le joueur #{name} a été tué !"
  end

  def search_health_pack
    health_pack_found = rand(1..6)

    if health_pack_found == 1
      puts "Tu n'as rien trouvé gros naze !"
    elsif (2..5).include?(health_pack_found)
      puts 'Tu as trouvé un pack de heal de 50'
      @life_points = [@life_points + 50, 100].min
    elsif health_pack_found == 6
      puts 'Tu as trouvé un pacj de heal de 80'
      @life_points = [@life_points + 80, 100].min
    end
  end

  def compute_damage2
    rand(1..6) * @weapon_level
  end
end
