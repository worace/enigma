require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/enigma"

describe Enigma do
  #example usage:
  #ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
  it "has an alphabet" do
    #lower chars, digits, space, period, comma
    alpha = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    assert_equal alpha, Enigma::ALPHABET
  end

  it "encrypts 4 chars" do
    # 9225
    # A: 9 B: 2 C: 2 D: 5
    # 41521
    # A: 41 B: 15 C: 52 D: 21
    # with offsets:
    # A: 50 B: 17 C: 54 D: 26
    date = 020315 #square -> 412699225; offsets: 9225
    key = 41521
    assert_equal "2.ql", Enigma.new.encrypt("ruby",key,date)
  end
end
