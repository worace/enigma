require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/key"

describe Key do
  #example usage:
  #ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
  it "turns key and date into arrays of chars" do
    assert_equal ["0","2","0","3","1","5"], Key.new("12345","020315").date
    assert_equal ["1","2","3","4","5"], Key.new("12345","020315").key
  end

  it "calculates offsets for date" do
    assert_equal [9,2,2,5], Key.new("12345","020315").date_offsets
  end

  it "calculates offsets for key" do
    assert_equal [41, 15, 52, 21], Key.new("41521","020315").key_offsets
  end

  it "calculates combined offsets" do
    assert_equal [50, 17, 54, 26], Key.new("41521","020315").offsets
  end

  it "can offset with 0 key" do
    k = Key.new("00000","020315")
    assert_equal [0,0,0,0], k.key_offsets
    assert_equal [9,2,2,5], k.date_offsets
    assert_equal [9,2,2,5], k.offsets
  end
end

