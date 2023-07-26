class Anagram
  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    possible_anagrams.select do |other_word|
      other_word.downcase.chars.sort == @word.downcase.chars.sort &&
      other_word.downcase != @word.downcase
    end
  end
end