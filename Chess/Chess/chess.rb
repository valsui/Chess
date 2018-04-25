require_relative 'cursor'
require_relative 'board'
require_relative 'piece'
require_relative 'display'
require_relative 'sliding_module'
require_relative 'stepping_module'
require_relative 'sliding'
require_relative 'stepping'


class Game
end

if __FILE__ == $0 
  b = Board.new 
  d = Display.new(b)
  
  k = Knight.new(:green)
  print k.get_moves([0,1], b)
  
  
  b.move_piece([0,0], [7,1])
  b.move_piece([7,2], [3,3])
  d.render
  p b.in_check?(:green)
end