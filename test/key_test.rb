require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/key"

describe Key do
  #example usage:
  #ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
  it "strips leading 0's from date" do
    assert_equal 20315, Key.new("12345","020315").date
  end

  it "doesnt mess up normal date" do
    assert_equal 120315, Key.new("12345","120315").date
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
end

