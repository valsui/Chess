# require_relative 'piece'
# # require_relative 'sliding_module'
# require_relative 'board'

class Knight < Piece 
  include SteppingModule
  
  def initialize(color)
    super(color) 
  end 
  
  def to_s
     
    return  "_🎠_|" if self.color == :green
    return  "_🏇_|" if self.color == :blue
    # " #{find_piece} "
  end
  
  def move_dirs
    [[-2,1], [-2,-1], [2,1], [2,-1], [1,2], [1,-2], [-1,-2], [-1,2]]
  end
  
end 

class King < Piece 
  include SteppingModule
  
  def initialize(color)
    super(color) 
  end 
  
  def to_s
     
    return  "_♚_|" if self.color == :blue 
    return  "_♔_|" if self.color == :green 
    # " #{find_piece} "
  end
  
  def move_dirs 
    [[-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]]
  end 
  
end 

class Pawn < Piece 
end 

# if __FILE__ == $0
#   b = Board.new 
# 
#   knight = Knight.new(:green)
#   king = King.new(:green)
# 
#   p knight.get_moves([5,5], b)
#   p king.get_moves([5,5], b)
# end
