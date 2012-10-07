class Cell
  @row = Partial.new
  @col = Partial.new
  @square = Partial.new

  def initialize(row, col, square)
  end
  
  def set_value(value)
    raise "Invalid Value" unless Board::VALID_VALUES.include?(value)
  end
end
