require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/char_set"

describe CharSet do
  it "contains the alphabet" do
    cs = CharSet.new
    alpha = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    assert_equal alpha, cs.alphabet
  end

  it "contains reversed alphabet when reversed" do
    cs = CharSet.new(:reverse)
    alpha = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    assert_equal alpha.reverse, cs.alphabet
  end

  it "gives position of a char" do
    assert_equal "d", CharSet.new.char_at(3)
    assert_equal "7", CharSet.new(:reverse).char_at(5)
  end

  it "has length" do
    assert_equal 39, CharSet.new.length
  end

  it "gives a char at a position" do
    assert_equal 5, CharSet.new(:reverse).position("7")
    assert_equal 3, CharSet.new.position("d")
  end

  it "finds distance between 2 chars" do
    assert_equal 17, CharSet.new(:reverse).distance("4","n")
    assert_equal 17, CharSet.new(:reverse).distance("n","4")
  end
end
