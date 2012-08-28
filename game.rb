class Game
  attr_accessor :id, :name, :platform, :date, :howtobuy, :got, :notes
  
  def initialize(id, name, platform, date, howtobuy, got, notes)
    @id = id.to_dec
    @name = name.strip
    @platform = platform.strip
    @date = date.strip.split(' ').to_date
    @howtobuy = howtobuy.strip.split(?/)
    @got = got.strip.to_i.to_bool
    @notes = notes.strip
  end
  
  def self.get(games, params = [])
    params = params.to_params
    
    params.each { |p|
      games.delete_if { |g|
        if p[:neg]
          g.platform == p[:value] || g.howtobuy.include?(p[:value]) || g.date.include?(p[:value])
        else
          not g.platform == p[:value] || g.howtobuy.include?(p[:value]) || g.date.include?(p[:value])
        end
      }
    }
    
    games
  end
  
  def self.count(games, params = [])
    platforms = []
    list = Hash.new(0)
    
    games = self.get(games, params)
    
    games.each { |g|
      list[g.platform.to_sym] += 1
    }
    
    list
  end
  
end
