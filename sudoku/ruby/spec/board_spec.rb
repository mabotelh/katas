require 'spec_helper'

describe Board do
  let (:board) {
    b = Board.new()    
  }

  it "should have 9 rows, 9 columns and 9 squares" do
    board.rows.size.should eq 9
    board.cols.size.should eq 9
    board.squares.size.should eq 9
  end

  it "should create cells which are the same across rows, columns and squares" do
    board.rows[0][0].should == board.cols[0][0]
    # board.rows[0][0].should == board.squares[0][0]
  end


end