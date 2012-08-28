require './utils.rb'
require './game.rb'

def help
  "ruby #{File.basename(__FILE__)} [filename] [get [PLATFORM, HOWTOBUY, YEAR] / count [PLATFORM, HOWTOBUY, YEAR] ]"
end

abort help if ARGV.length < 2

games    = []
filename = ARGV[0]
action   = ARGV[1]
params   = ARGV[2..-1]

File.read(filename).each_line { |l|
  next if l.start_with?(?#) || l.start_with?('//')
  ary = l.split(' - ')
  next if ary.length < 5
  games << Game.new(games.length, ary[0], ary[1], ary[2], ary[3], ary[4], ary[5] || '')
}

case action

  when 'get'
    list = Game.get(games, params)
    list.each { |g|
      got = g.got ? 'Acquired' : 'Not acquired'
      notes = g.notes.empty? ? '' : "`#{g.notes}`"
      printf "#%-2d %-20s %-5s %-20s %-15s %-15s %s\n", g.id, g.name, g.platform, g.date.join(' '), g.howtobuy.join('/'), got, notes
    }
    
  when 'count'
    total = 0
    
    list = Game.count(games, params)
    list.each { |p, o|
      printf "%-3s: %-5d\n", p, o
      total += o
    }
    
    puts "Total: #{total}"
    
end
