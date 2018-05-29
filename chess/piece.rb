class Piece
  attr_accessor :pos, :type

  attr_reader :board, :color

  def initialize(color, board, pos)
    @type = "O"
    @color = color
    @board = board
    @pos = pos
  end

  def to_s

  end

  def empty?

  end

  def valid_moves
    move = moves
    move.reject { |mv| board[mv].color == color }
  end

  def pos=(val)
  end

  def symbol
    self.class.to_s.to_sym
  end

  private

  def move_into_check?(end_pos)
    temp_arr = self.board.dup
    temp_board = Board.new(temp_arr)
    temp_board.move_piece!(self.color, self.pos, end_pos)
    temp_board.in_check?(self.color)
  end

end
