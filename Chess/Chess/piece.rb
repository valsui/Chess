require 'singleton'
# require_relative 'sliding_module'
# require_relative 'stepping_module'
# # require_relative 'sliding'
# # require_relative 'stepping'
# require_relative 'board'


class Piece
  
  attr_reader :color, :move_dirs
  
  def initialize(color)
    @color = color
    @moves = []
    @move_dirs = self.move_dirs
  end
  
  def move_dirs
    []
  end
  
  def get_moves(pos,board)
    []
  end
  
  def to_s
     
    return  " 🍤 " if self.color == :green
    return  " 🦐 " if self.color == :blue
    # " #{find_piece} "
  end
  
  def moves(pos) 
    @moves = self.get_moves(pos, board)
  end
  
  # def find_piece
  #   ""
  # end
  
  def invalid_move?(pos, board)
    if pos.nil?
      false
    elsif pos.any? {|x| x < 0 || x > 7}
      true 
    elsif !board[pos].is_a?(NullPiece)
      true 
    else
      false 
    end
  end
  
  
  def inspect 
    # puts "#{self.class}"
  end
end

class NullPiece < Piece
  include Singleton 
    
  def initialize
    @color = :black
  end
  
  def to_s
    "   "
  end
  
end