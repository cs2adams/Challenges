class BeerSong
  MAX_BOTTLES = 99
  MIN_BOTTLES = 0

  def self.verse(verse_num)
    "#{num_bottles(verse_num)} of beer on the wall, " \
      "#{num_bottles(verse_num).downcase} of beer.\n" \
      "#{next_action(verse_num)}, "\
      "#{num_bottles(verse_num - 1).downcase} of beer on the wall.\n"
  end

  def self.verses(first, last)
    first.downto(last).each_with_object('') do |verse_num, words|
      words << verse(verse_num)
      words << "\n" unless verse_num == last
    end
  end

  def self.lyrics
    verses(MAX_BOTTLES, MIN_BOTTLES)
  end

  def self.num_bottles(verse_num)
    if verse_num < 0
      '99 bottles'
    elsif verse_num == 0
      'No more bottles'
    elsif verse_num == 1
      '1 bottle'
    else
      "#{verse_num} bottles"
    end
  end

  def self.next_action(num_bottles)
    return 'Go to the store and buy some more' if num_bottles == 0
    "Take #{num_bottles == 1 ? 'it' : 'one'} down and pass it around"
  end
end
