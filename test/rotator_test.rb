require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/rotator"

describe Rotator do
  it "has an alphabet" do
    #lower chars, digits, space, period, comma
    alpha = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    assert_equal alpha, Rotator::ALPHABET
  end

  it "finds indices of chars" do
    assert_equal chunk(0), Rotator.new(chunk("a"), nil).char_indices
  end

  it "rotates large offsets back to beginning of alphabet" do
    assert_equal chunk(1), Rotator.new(chunk("."), chunk(3)).rotated_indices
  end

  it "rotates 4 chars using provided offsets" do
    offsets = chunk(1)
    input = chunk("a")
    assert_equal chunk("b"), Rotator.new(input, offsets).rotated_chars
  end
end

def chunk(value, size = 4)
  Array.new(size) { value }
end
