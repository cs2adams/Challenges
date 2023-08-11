class Octal
  VALID_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7']
  BASE = 8

  def initialize(num)
    @num = valid_input?(num) ? num : '0'
  end

  def to_decimal
    digit_values = @num.chars.reverse.map.with_index do |digit, idx|
      digit.to_i * (BASE**idx)
    end
    digit_values.sum
  end

  private

  def valid_input?(input)
    input.is_a?(String) &&
      input.chars.all? { |char| VALID_DIGITS.include?(char) }
  end
end
