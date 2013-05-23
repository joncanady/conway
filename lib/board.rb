class Board

  # Public: Initialize a new Board
  #
  # height - the Integer height in cells
  # width  - the Integer width in cells
  def initialize(height, width)
    @height, @width = height, width
  end

  def evolve
    new_board = self.class.new
    new_board
  end

end
