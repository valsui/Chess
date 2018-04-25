require 'byebug'

module SlidingModule
  
  def get_moves(start_pos, board)
    arr = []
    keep_pieces = []
    
    # byebug
    
    @move_dirs.each do |pos|
       i = 1
      until invalid_move?(arr.last,board) #|| arr.any? { |el| el.include?(-1) } || arr.any? { |el| el.include?(8) }
    
        temp_pos = pos.map { |x| x * i }
        arr << [temp_pos.first + start_pos.first, temp_pos.last + start_pos.last]
        
        i += 1
      end
      
      keep_pieces << arr.pop
    end
    
    keep_pieces.each do |pos|
      if pos.any? {|x| x < 0 || x > 7}
        next
      elsif board[pos].color != self.color && board[pos].color != :black
        arr << pos 
      end
    end
        
    arr
  end
  
  
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
end