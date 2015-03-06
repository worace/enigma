class CharSet
  ALPHABET = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  ALPHABETS = {:forward => ALPHABET, :reverse => ALPHABET.reverse}

  attr_reader :alphabet

  def initialize(dir = :forward)
    @alphabet = ALPHABETS.fetch(dir)
  end

  def char_at(index)
    alphabet[index]
  end

  def length
    alphabet.length
  end

  def position(char)
    alphabet.index(char)
  end

  def distance(a,b)
    (position(b) - position(a)).abs
  end
end
