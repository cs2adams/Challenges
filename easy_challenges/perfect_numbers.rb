class InvalidNumberError < StandardError; end

class PerfectNumber
  def self.classify(num)
    raise InvalidNumberError unless num.is_a?(Integer) && num > 0
    aliquot_sum = (1...num).select { |n| num % n == 0 }.sum
    
    case aliquot_sum <=> num
    when -1   then 'deficient'
    when 0    then 'perfect'
    when 1    then 'abundant'
    end
  end
end