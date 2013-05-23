require 'minitest/autorun'
require_relative '../lib/board'

describe Board do 
  it 'should initialize by dimensions' do
    Board.new(4,8).wont_equal nil
  end

  describe 'evolving itself' do 
    it 'returns a new board of the same size' do
      board = Board.new(4,8)
      new_board = board.evolve

      new_board.height.must_equal 4
      new_board.width.must_equal 8
      new_board.wont_equal board
    end
  end

  describe 'rendering' do 
    it 'to_s gives a string representation' do
      board = Board.new(2,2)
      board.to_s.must_equal "..\n..\n"
    end

    it 'renders width number of cells in a line' do
      board = Board.new(3,3)
      board.to_s.split("\n")[0].size.must_equal 3
    end

    it 'renders height number of lines' do
      board = Board.new(3,3)
      board.to_s.split("\n").count.must_equal 3
    end
  end

  describe 'toggling' do 
    it 'makes dead cells alive' do
      board = Board.new(2,2)
      board.toggle(1,1)
      board.to_s.must_equal "..\n.*\n"
    end

    it 'makes alive cells dead' do 
      board = Board.new(2,2)
      board.toggle(1,1)
      board.toggle(1,1)
      board.to_s.must_equal "..\n..\n"
    end
  end

  describe 'evolving a board' do
    it 'watevs' do
      board = Board.new(4,8)
      board.toggle(1,4)
      board.toggle(2,3)
      board.toggle(2,4)
      board.evolve.to_s.must_equal <<EOBOARD
........
...**...
...**...
........
EOBOARD
    end

    it 'handles a blinker' do
      skip "alive neighbor count"
      board = Board.new(3,3)
      board.toggle(1,0)
      board.toggle(1,1)
      board.toggle(1,2)
      board.to_s.must_equal "...\n***\n...\n"
      board = board.evolve
      board.to_s.must_equal ".*.\n.*.\n.*.\n"
      board = board.evolve
      board.to_s.must_equal "...\n***\n...\n"
      board = board.evolve
      board.to_s.must_equal ".*.\n.*.\n.*.\n"
    end
  end

  describe "counting alive neighbors" do 
    it "counts a single cell as having no alive neighbors" do
      board = Board.new(1,1)
      board.alive_neighbor_count(0,0).must_equal 0
    end

    it "counts one alive neighbor" do 
      skip 
      board = Board.new(2,1)
      board.toggle(1,0)
      board.alive_neighbor_count(0,0).must_equal 1
    end
  end

end
