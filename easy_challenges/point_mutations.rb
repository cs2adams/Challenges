class DNA
  def initialize(sequence)
    @sequence = sequence
  end

  def hamming_distance(other_sequence)
    sequences = [@sequence, other_sequence].sort_by(&:size)
    short_sequence = sequences[0]
    long_sequence = sequences[1]

    mutations = short_sequence.chars.reject.with_index do |base, idx|
      base == long_sequence[idx]
    end

    mutations.size
  end
end