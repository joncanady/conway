class Board
  attr_reader :height, :width, :cells

  # Public: Initialize a new Board
  #
  # Initializes all cells to dead.
  #
  # height - the Integer height in cells
  # width  - the Integer width in cells
  def initialize(height, width)
    @height, @width = height, width
    @cells = Array.new(height) { Array.new(width) { '.' } }
  end

  # Public: Create a new board having moved one iteration forward.
  #
  # Follows the rules for Conway's Game of Life from:
  # http://cyber-dojo.com/setup/show
  #
  # Returns the new Board.
  def evolve
    new_board = self.class.new(@height, @width)
    new_board
  end

  # Public: Toggle the cell at the given coords.
  #
  # x - The Integer x position.
  # y - The Integer y position.
  #
  # Returns nothing.
  def toggle(x,y)
    cell = cells[x-1][y-1] 
    if cell ==  '*' then 
      cell.replace '.'
    else
      cell.replace '*'
    end
  end

  # Public: Renders the board as a string.
  #
  # Returns a string.
  def to_s
    string = ''
    cells.each do |*c|
      string << c.join
      string << "\n"
    end
    string
  end

end
