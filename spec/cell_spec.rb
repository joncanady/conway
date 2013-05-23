require 'minitest/autorun'
require_relative '../lib/cell'

describe Cell do 
  it "renders as a string" do 
    Cell.new.to_s.must_equal '.' 
  end

  it "is dead by default" do 
    refute Cell.new.alive?, "Expected dead cell, got live."
  end

  describe "toggling" do
    it "converts alive cells to dead" do 
      cell = Cell.new
      cell.toggle
      cell.to_s.must_equal '*'
    end
  end
end
