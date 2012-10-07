require 'set'

class Partial
  def initialize
    @used_values = Set.new()
  end

  def add_value(value)
    raise "Value already in set" unless @used_values.add?(value)
  end

  def possible_values
    Board::VALID_VALUES.to_set ^ @used_values
  end

end
