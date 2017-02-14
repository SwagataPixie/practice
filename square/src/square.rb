class Square
  def initialize(side)
    @side = side
  end

  def perimeter
    @side * 4
  end

  def area
    @side * @side
  end
end
