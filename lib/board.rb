class Board
  attr_reader :height, :width

  # Public: Initialize a new Board
  #
  # height - the Integer height in cells
  # width  - the Integer width in cells
  def initialize(height, width)
    @height, @width = height, width
  end

  def evolve
    new_board = self.class.new(@height, @width)
    new_board
  end

  def to_s
    string = ''
    height.times do
      width.times { string << '.' }
      string << "\n"
    end
    string
  end

end
