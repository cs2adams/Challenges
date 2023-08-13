require 'pry'
require 'pry-byebug'

class Diamond
  FIRST_LETTER = 'A'

  def self.make_diamond(letter)
    letters = (FIRST_LETTER..letter).to_a
    length = letters.size * 2 - 1

    output = []
    letter_idx = [0, length - 1]

    letters.reverse.each do |current_letter|
      line = current_line(current_letter, letter_idx, length)
      output.unshift(line)
      output.push(line) unless output.size == 1

      letter_idx[0] += 1
      letter_idx[1] -= 1
    end

    output.join('')
  end

  def self.current_line(current_letter, letter_idx, length)
    blank_line = "#{' ' * length}\n"
    letter_idx.each_with_object(blank_line) do |idx, str|
      str[idx] = current_letter
    end
  end
end
