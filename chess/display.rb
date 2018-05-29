require "colorize"
require_relative "cursor.rb"
require_relative "board.rb"
class Display
  attr_accessor :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
    @debug = false
  end

  def render
    curs_row, curs_col = self.cursor.cursor_pos
    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        if (curs_row == row_idx && curs_col == col_idx)
          print " #{el.symbol} ".colorize(:background => :red)
        else
          print " #{el.symbol} "
        end
        print "|" if col_idx != row.length - 1
      end
      print "\n-------------------------------\n"
    end
  end


end

#
if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  index = 0
  while index < 4
    d.render
    d.cursor.get_input
    p d.cursor.cursor_pos
    sleep(0.5)
    system "clear"
    index += 1
  end
end
