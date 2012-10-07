require "awesome_print"

class Board
  SIZE = 9
  VALID_VALUES = (1..SIZE).to_a
  attr_reader :rows, :cols, :squares
  def initialize
    @rows = Array.new(SIZE, Array.new(SIZE))
    @cols = Array.new(SIZE, Array.new(SIZE))
    @squares = Array.new(SIZE, Array.new(SIZE))
    @board = Array.new(SIZE ** 2)

    (0..8).each do |row|
      (0..8).each do |col|
        set_cell(row, col, row + 1)
      end
    end

    # ap @board
  end

  def set_cell(row, col, value)
    raise "Invalid value" unless VALID_VALUES.include?(value)
    @rows[row][col] = value
    @cols[row][col] = value
    @board[row*SIZE + col] = value

    square_index = (row / 3 + col / 3) + (row / 3 * 3 - row/3)
    # ap "row #{row}, col #{col}, value #{value}, square_index #{square_index}, square[square_index] square[#{row/3 + col/3}"
  end

end
