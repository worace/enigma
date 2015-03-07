require_relative "char_set"

class Rotator
  attr_reader :chars, :offsets, :char_set

  def initialize(chars, offsets, char_set = CharSet.new)
    @chars = chars
    @offsets = offsets
    @char_set = char_set
  end

  def rotated_chars
    rotated_indices.map { |i| char_set.char_at(i) }
  end

  def rotated_indices
    char_indices.each_slice(4).flat_map do |slice|
      slice.zip(offsets).map { |pair| pair.reduce(:+) % char_set.length}
    end
  end

  def char_indices
    chars.map { |c| char_set.position(c) }
  end
end
