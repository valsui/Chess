# require_relative 'piece'
require 'byebug'
class Board
  
  attr_reader :board
  
  def initialize
    @board = Array.new(8) { Array.new(8, NullPiece.instance) }
    fill_board
  end
  
  def fill_board
    start_rows = [0, 1, 6, 7]
    @board.each_with_index do |rows, row|
      rows.each_with_index do |columns, column|
        pos = [row, column]
        if start_rows.include?(row)
          self[[row, column]] = Piece.new(:blue) if row == 1 
          self[[row, column]] = Piece.new(:green) if row == 6 
          self[pos] = Rook.new(:blue) if pos == [0,0] || pos == [0,7]
          self[pos] = Rook.new(:green) if pos == [7,0] || pos == [7,7]
          self[pos] = Knight.new(:blue) if pos == [0,1] || pos == [0,6]
          self[pos] = Knight.new(:green) if pos == [7,1] || pos == [7,6]
          self[pos] = Bishop.new(:blue) if pos == [0,2] || pos == [0,5]
          self[pos] = Bishop.new(:green) if pos == [7,2] || pos == [7,5]
          self[pos] = King.new(:blue) if pos == [0,3] 
          self[pos] = King.new(:green) if pos == [7,3] 
          self[pos] = Queen.new(:blue) if pos == [0,4] 
          self[pos] = Queen.new(:green) if pos == [7,4] 
        end 
      end
    end
  end
  
  def move_piece(start_pos, end_pos)
    if !valid_move?(start_pos, end_pos)
      raise "Invalid move"
    elsif self[start_pos].is_a?(NullPiece)
      raise "Can't move nothing."
    else
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end
  
  def get_king(color)
    king_pos = []
    @board.each_with_index do |arr, row|
      arr.each_with_index do |piece, col|
        pos = [row, col]
        king_pos = pos if piece.is_a?(King) && piece.color == color 
      end
    end
    king_pos
  end
  
  def other_piece_colors(color)
    others_pos = []
    @board.each_with_index do |arr, row|
      arr.each_with_index do |piece, col|
        pos = [row, col]
        others_pos << pos if piece.color != color && !piece.is_a?(NullPiece)
      end
    end
    others_pos
  end   
  
  
  def in_check?(color)
    king_pos = get_king(color)
    others_pos = other_piece_colors(color)
    others_pos.reverse!

    others_pos.each do |pos|
      piece = self[pos]
      valid_positions = piece.get_moves(pos, self)
      # valid_positions = @board[pos].get_moves(pos, @board)
      if valid_positions.include?(king_pos)
        return true
      end 
    end 
    false 
  end
  
  def checkmate?(king_pos)
    self[king_pos].get_moves(king_pos, self) == []
  end
  
  def valid_move?(start_pos, end_pos)
    a , b = start_pos 
    c , d = end_pos 
    
    [a,b,c,d].all? { |el| el.between?(0,7) } 
  end 
  
  def [](pos)
    row, col = pos 
    @board[row][col] 
  end
  
  def []=(pos, mark)
    row, col = pos 
    @board[row][col] = mark
  end
  
  def inspect
    ""
  end
  
  def to_s
    ""
  end
  
end


