# require_relative 'cursor'
# require_relative 'board'
# require_relative 'piece'
# # require_relative 'sliding_module'
# # require_relative 'stepping_module'
# require_relative 'sliding'
# require_relative 'stepping'


require 'colorize'

class Display
  attr_reader :cursor
  def initialize(board = Board.new)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def render 
    system('clear')
    @cursor.get_input
    @cursor_pos = @cursor.cursor_pos
    header = ("a".."h").to_a
    header.each { |el| print "  #{el}"} 
    print " \n"
    @board.board.each_with_index do |rows, i|
      print "#{i}"
      rows.each_with_index do |cols, j|
        if [i, j] == @cursor_pos
          print cols.to_s.bg_red 
        elsif (i + j).even?
          print cols.to_s.bg_gray
        else 
          print cols.to_s
        end
        # print cols.to_s.colorize(cols.color) unless [i, j] == @cursor_pos 
        # print cols.to_s.colorize(cols.color) unless [i, j] == @cursor_pos && (i + j).even?
      end 
      print "\n"
    end 
  end
  
  def inspect
    ""
  end
  
  def to_s
    ""
  end
  
end

class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end

def bg_black;       "\e[40m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
def bg_green;       "\e[42m#{self}\e[0m" end
def bg_brown;       "\e[43m#{self}\e[0m" end
def bg_blue;        "\e[44m#{self}\e[0m" end
def bg_magenta;     "\e[45m#{self}\e[0m" end
def bg_cyan;        "\e[46m#{self}\e[0m" end
def bg_gray;        "\e[47m#{self}\e[0m" end

def bold;           "\e[1m#{self}\e[22m" end
def italic;         "\e[3m#{self}\e[23m" end
def underline;      "\e[4m#{self}\e[24m" end
def blink;          "\e[5m#{self}\e[25m" end
def reverse_color;  "\e[7m#{self}\e[27m" end
end







