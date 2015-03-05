class Rotator
  ALPHABET = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  attr_reader :chars, :offsets
  def initialize(chars, offsets)
    @chars = chars
    @offsets = offsets
  end

  def rotated_chars
    rotated_indices.map { |i| ALPHABET[i] }
  end

  def rotated_indices
    char_indices.zip(offsets).map { |pair| pair.reduce(:+) % ALPHABET.length}
  end

  def char_indices
    chars.map { |c| ALPHABET.index(c) }
  end
end
