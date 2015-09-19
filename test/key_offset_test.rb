require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/key_offset"

describe KeyOffset do
  it "takes a string key and generated numeric offsets" do
    assert_equal [41, 15, 52, 21], KeyOffset.new("41521").offsets
  end

  it "generates a random key if no string is provided" do
    assert_equal 4, KeyOffset.new.offsets.length
    assert KeyOffset.new.offsets.all? { |i| i.is_a?(Fixnum) }
  end
end
