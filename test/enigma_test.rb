require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/enigma"

describe Enigma do
  #example usage:
  #ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415

  it "encrypts 4 chars" do
    # 9225
    # A: 9 B: 2 C: 2 D: 5
    # 41521
    # A: 41 B: 15 C: 52 D: 21
    # with offsets:
    # A: 50 B: 17 C: 54 D: 26
    date = "020315" #square -> 412699225; offsets: 9225
    key = "41521"
    assert_equal "2.ql", Enigma.new.encrypt("ruby",key,date)
  end

  it "decrypts 4 chars" do
    date = "020315" #square -> 412699225; offsets: 9225
    key = "41521"
    assert_equal "ruby", Enigma.new.decrypt("2.ql",key,date)
  end

  it "encrypts a longer message" do
    key = "41521"
    date = "020315"
    assert_equal "svx.i6xm rmjsr8fi.4xjptaopn", Enigma.new.encrypt("heil pizza whats up ..end..",key,date)
  end

  it "decrypts a longer message" do
    key = "41521"
    date = "020315"
    assert_equal "heil pizza whats up ..end..", Enigma.new.decrypt("svx.i6xm rmjsr8fi.4xjptaopn",key,date)
  end

  it "cracks a message containing the giveaway string" do
    date = "020315"
    assert_equal "l pizza whats up ..end..", Enigma.new.crack(".i6xm rmjsr8fi.4xjptaopn",date)
  end
end
