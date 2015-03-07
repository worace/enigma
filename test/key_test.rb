require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/key"

describe Key do
  it "generates key with proper offsets for keystring and datestring" do
    k = Key.for("41521","020315")
    assert_equal [41,15,52,21], k.key_offsets
    assert_equal [9,2,2,5], k.date_offsets
  end
  it "calculates combined offsets" do
    assert_equal [50, 17, 54, 26], Key.new([41,15,52,21],[9,2,2,5]).offsets
  end

  it "can offset with 0 key" do
    k = Key.new([0,0,0,0],[9,2,2,5])
    assert_equal [9,2,2,5], k.offsets
  end
end

