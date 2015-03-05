class Rotator
  ALPHABET = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  ALPHABETS = {:forward => ALPHABET, :reverse => ALPHABET.reverse}

  attr_reader :chars, :offsets, :alphabet

  def initialize(chars, offsets, dir = :forward)
    @chars = chars
    @offsets = offsets
    @alphabet = ALPHABETS[dir]
  end

  def rotated_chars
    rotated_indices.map { |i| alphabet[i] }
  end

  def rotated_indices
    char_indices.zip(offsets).map { |pair| pair.reduce(:+) % alphabet.length}
  end

  def char_indices
    chars.map { |c| alphabet.index(c) }
  end
end
