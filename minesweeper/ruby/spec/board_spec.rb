require 'spec_helper'

describe Board do
  ROWS = 3
  COLS = 3
  let (:board) {
    b = Board.new(ROWS,COLS)    
  }

  it "should create a board with the right dimensions" do
    board.columns.should eq COLS
    board.rows.should eq ROWS
  end

  it "should initialize the board with 0" do
    board.should eql [
      [0,0,0],
      [0,0,0],
      [0,0,0]]
  end

  # check creation for invalid size

  it "should mark mines with *" do 
    board.add_mine(1,1).should eq "*"
    board[1,1].should eq "*"
  end

  describe "when mine added neighboring cells should say at least 1" do
    describe "should respect corners" do
      it "top left corner" do
        board.add_mine(0,0)
        board.should eql [
          ["*",1,0],
          [1,1,0],
          [0,0,0]
        ]
      end

      it "bottom left corner" do
        board.add_mine(2,0)
        board.should eql [
          [0,0,0],
          [1,1,0],
          ["*",1,0]
        ]
      end

      it "top right corner" do
        board.add_mine(0,2)
        board.should eql [
          [0,1,"*"],
          [0,1,1],
          [0,0,0]
        ]
      end

      it "bottom right corner" do
        board.add_mine(2,2)
        board.should eql [
          [0,0,0],
          [0,1,1],
          [0,1,"*"]
        ]
      end

      it "middle left corner" do
        board.add_mine(1,0)
        board.should eql [
          [1,1,0],
          ["*",1,0],
          [1,1,0]
        ]
      end

      it "middle right corner" do
        board.add_mine(1,2)
        board.should eql [
          [0,1,1],
          [0,1,"*"],
          [0,1,1]]
      end

      it "center top" do
        board.add_mine(0,1)
        board.should eql [
          [1,"*",1],
          [1,1,1],
          [0,0,0]]
       end

      it "center bottom" do
        board.add_mine(2,1)
        board.should eql [
          [0,0,0],
          [1,1,1],
          [1,"*",1]]
      end
    end

    it "should work for the middle cell" do
      board.add_mine(1,1)
      board.should eql [
          [1,1,1],
          [1,"*",1],
          [1,1,1]]
    end
  end

  it "should respect neighboring mines" do
    board.add_mine(1,0)  
    board.add_mine(0,0)
    board.should eql [
      ["*",2,0],
      ["*",2,0],
      [1,1,0]]

    board.add_mine(1,1)
    board.should eql [
      ["*",3,1],
      ["*","*",1],
      [2,2,1]]
  end

  describe :get do
    it "should return nil when out of bounds" do
      board[-1,0].should be_nil
      board[0,-1].should be_nil
      board[ROWS,0].should be_nil
      board[0,COLS].should be_nil
    end
  end
end
