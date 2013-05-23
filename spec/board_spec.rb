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
      board.toggle(2,2)
      board.to_s.must_equal "..\n.*\n"
    end

    it 'makes alive cells dead' do 
      board = Board.new(2,2)
      board.toggle(2,2)
      board.toggle(2,2)
      board.to_s.must_equal "..\n..\n"
    end
  end

  describe 'evolving a board' do
    it '' do
      board = Board.new(4,8)
      board.toggle(2,5)
      board.toggle(3,4)
      board.toggle(3,5)
      board.evolve.to_s.must_equal <<EOBOARD
........
...**...
...**...
........
EOBOARD
    end
  end
end
