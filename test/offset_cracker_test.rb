require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/offset_cracker"
require_relative "../lib/encryptor"

describe OffsetCracker do
  it "uses last 4 chars as key chars" do
    assert_equal "yuny".chars, OffsetCracker.new("abcdyuny", "020315").key_chars
  end

  it "finds date offsets" do
    assert_equal [9,2,2,5], OffsetCracker.new("abcdyuny", "020315").date_offsets
  end

  it "reverses the date rotation to find characters after key rotation" do
    # orignal: "nd.."
    # final: "yuny"
    # "nd.." -> "pslt" -> "yuny"
    assert_equal "pslt".chars, OffsetCracker.new("abcdyuny", "020315").chars_minus_date_offset
  end

  it "finds the a valid key given a date and 4 key characters" do
    date = "020315"
    message = "yuny"
    offsets = OffsetCracker.new(message, date).offsets
    assert_valid_rotation [41,15,52,21], offsets
  end

  it "returns a key object with necessary key when asked" do
    date = "020315"
    message = "yuny"
    key = OffsetCracker.new(message, date).key
    assert_valid_rotation [41,15,52,21], key.key_offsets
    assert_equal [9,2,2,5], key.date_offsets
  end
end

def assert_valid_rotation(a,b)
  a.zip(b).all? do |pair|
    pair.first % CharSet.new.length == pair.last % CharSet.new.length
  end
end
