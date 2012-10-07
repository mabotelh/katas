require 'spec_helper'

describe Partial do
  let (:partial) {
    p = Partial.new
  }

  describe :add_value do
    it "should not allow duplications" do
      partial.add_value(1)
      expect {partial.add_value(1)}.to raise_error
    end
  end

  describe :possible_values do
    it "should return all values when no used_values" do
      expect(partial.possible_values).to eql Board::VALID_VALUES.to_set
    end

    it "should return no values when all are in use" do
      (1..9).each do |value|
        partial.add_value(value)
      end
      expect(partial.possible_values).to eql Set.new
    end

  end

end