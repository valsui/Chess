# require_relative 'piece'
# # require_relative 'sliding_module'
# require_relative 'board'

class Queen < Piece
  
  include SlidingModule
  # def initialize
  #   @symbol = :queen
  # 
  # end 
  def initialize(color)
    super(color) 
  end 
  
  def to_s
     
    return  "_♕_|" if self.color == :green
    return  "_♛_|" if self.color == :blue
    # " #{find_piece} "
  end
  
  def move_dirs
    [[-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]]
  end
  
end 

class Bishop < Piece 
  include SlidingModule
  # def initialize
  #   @symbol = :bishop
  # end 
  def initialize(color)
    super(color) 
  end 
  
  def to_s
     
    return  "_♗_|" if self.color == :green
    return  "_♝_|" if self.color == :blue
    # " #{find_piece} "
  end
  
  def move_dirs
    [[-1,-1],[-1,1], [1,-1], [1,1]]
  end
end 

class Rook < Piece
  include SlidingModule
  # def initialize
  #   @symbol = :rook
  # end 
  def initialize(color)
    super(color) 
  end 
  
  def to_s
     
    return  "_♖_|" if self.color == :green
    return  "_♜_|" if self.color == :blue
    # " #{find_piece} "
  end
  
  def move_dirs
    [[-1,0],[0,-1], [0,1], [1,0]]
  end
end

# if __FILE__ == $0
#   b = Board.new 
# 
# 
#   q = Queen.new(:green)
#   r = Rook.new(:green)
#   bish = Bishop.new(:green)
#   knight = Knight.new(:green)
#   king = King.new(:green)
# 
#   p q.get_moves([5,5], b)
#   p r.get_moves([5,5], b)
#   p bish.get_moves([5,5], b)
#   p knight.get_moves([5,5], beg)
# end