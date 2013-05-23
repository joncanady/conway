class Cell

  def alive?
    !!@alive
  end

  def to_s
    alive? ? '*' : '.'
  end

  def toggle 
    @alive = !@alive
  end

end
