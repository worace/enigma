class KeyOffset
  attr_reader :key_string
  def initialize(key_string = random_key_string)
    @key_string = key_string
  end

  def random_key_string
    (0...5).map { rand(9) }.join
  end

  def offsets
    overlapping_slices(key_string.chars, 2).map { |pair| pair.join.to_i }
  end

  def overlapping_slices(chars, length)
    if chars.length >= length
      [chars.first(2)] + overlapping_slices(chars[1..-1], length)
    else
      []
    end
  end
end
