class SumOfMultiples
  DEFAULT_NUMS = [3, 5]

  def initialize(*numbers)
    @numbers = numbers
  end

  def to(max_num)
    seen = Hash.new(false)
    total = 0

    @numbers.each do |base_num|
      current_num = base_num

      while current_num < max_num
        unless seen[current_num]
          total += current_num
          seen[current_num] = true
        end

        current_num += base_num
      end
    end

    total
  end

  def self.to(max_num)
    SumOfMultiples.new(*DEFAULT_NUMS).to(max_num)
  end
end
