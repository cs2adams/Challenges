class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a
  @@names = []

  attr_reader :name

  def initialize
    self.name = new_name
    @@names << name
  end

  def reset
    old_name = name
    self.name = new_name
    @@names << name
    @@names.delete(old_name)
  end

  private

  attr_writer :name

  def new_name
    current_name = ''

    loop do
      current_name = randomize_name
      break unless @@names.include?(current_name)
    end

    current_name
  end

  def randomize_name
    output = ''
    2.times { output << LETTERS.sample }
    3.times { output << DIGITS.sample }
    output
  end
end
