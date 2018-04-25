require "byebug"
module SteppingModule
  def get_moves(start_pos, board)
    arr = []
    keep_pieces = []
    
    
    @move_dirs.each do |pos|
      temp_pos = [pos.first + start_pos.first, pos.last + start_pos.last]
      
      if !invalid_move?(temp_pos,board) # || arr.any? { |el| el.include?(-1) } || arr.any? { |el| el.include?(8) 
        arr << temp_pos
      else 
        keep_pieces << temp_pos
      end
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