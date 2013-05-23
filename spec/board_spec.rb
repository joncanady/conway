require 'minitest/autorun'
require_relative '../lib/board'

describe Board do 
  it 'should initialize by dimensions' do
    Board.new(4,8).wont_equal nil
  end
end
