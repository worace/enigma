class KeyOffset
  attr_reader :key_string
  def initialize(key_string)
    @key_string = key_string
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
