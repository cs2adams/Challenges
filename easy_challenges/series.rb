class Series
  def initialize(str)
    @str = str
  end

  def slices(length)
    raise ArgumentError.new 'Slice cannot be longer than series' if length > @str.size
    output = []

    (@str.size - length + 1).times do |idx|
      output << @str.slice(idx, length).chars.map(&:to_i)
    end

    output
  end
end