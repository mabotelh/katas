require 'spec_helper'

describe Cell do
  let (:cell) { c = Cell.new}

  describe :set_value do
    it "should allow only valid values (1..9)" do
      expect {cell.set_value(0)}.to raise_error
      expect {cell.set_value(10)}.to raise_error
    end

  end
end