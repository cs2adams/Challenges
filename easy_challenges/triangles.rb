class Triangle
  def initialize(length1, length2, length3)
    @lengths = [length1, length2, length3].sort
    if @lengths.first <= 0
      raise ArgumentError, 'Lengths must be greater than zero'
    end

    if @lengths.last >= lengths[0..1].sum
      raise ArgumentError, "Invalid side lengths"
    end
  end

  def kind
    case @lengths.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else        'scalene'
    end
  end

  private

  attr_reader :lengths
end
