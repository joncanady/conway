require_relative './cell'
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
    @cells = Array.new(height) { Array.new(width) { Cell.new } }
  end

  # Public: Create a new board having moved one iteration forward.
  #
  # Follows the rules for Conway's Game of Life from:
  # http://cyber-dojo.com/setup/show
  #
  # Returns the new Board.
  def evolve
    new_board = dup
    height.times do |h|
      width.times do |w|
        new_board.toggle(h+1, w+1) if should_toggle?(h+1, w+1)
      end
    end
    new_board
  end

  def should_toggle?(x,y)
    cell = cells[x-1][y-1]
    count = alive_neighbor_count(x-1,y-1)

    if cell.alive?
      count < 2 || count > 3
    else 
      count == 3
    end
  end

  def alive_neighbor_count(x,y)
    count = 0
    (-1 .. 1).each do |dx|
      (-1 .. 1).each do |dy|
        next if dx == 0 && dy == 0
        count += 1 if cells[x+dx] && cells[x+dx][y+dy] && cells[x+dx][y+dy].alive?
      end
    end
    count
  end

  # Public: Toggle the cell at the given coords.
  #
  # x - The Integer x position.
  # y - The Integer y position.
  #
  # Returns nothing.
  def toggle(x,y)
    cells[x-1][y-1].toggle
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
