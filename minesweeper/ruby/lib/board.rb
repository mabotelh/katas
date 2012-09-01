require "awesome_print"

class Board

  def initialize(rows, cols) 
    @rows = Array.new(rows) { |i| Array.new(cols, 0) }
  end

  def columns
    @rows[0].size
  end

  def rows
    @rows.size
  end

  def add_mine(row, col)
    increment_neighbours(row,col)
    @rows[row][col] = "*"
  end

  def [] (row,col)
    return nil if row < 0 || row > @rows.size - 1 ||  col < 0 || col > @rows[0].size - 1
   @rows[row][col]
  end
  alias :get :[]

  def eql?(board)
    @rows.eql?(board)
  end

  private
  def increment_neighbours(row, col)
    ((row-1)..(row+1)).each do |x|
      (col-1..col+1).each do |y|
        increment_cell(x,y) unless (x == row && y == col)
      end
    end
  end

  def increment_cell(row,col)
    cell = get(row,col)
    @rows[row][col] = cell + 1 unless cell.nil? || cell == "*"
  end

end
