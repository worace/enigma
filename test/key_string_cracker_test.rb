require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/key_string_cracker"

describe KeyStringCracker do
  it "uses last 4 chars as key chars" do
    assert_equal "yuny".chars, KeyStringCracker.new("abcdyuny", "020315").key_chars
  end

  it "cracks a key by trying all permutations from 00000 to 99999" do
    date = "020315"
    message = "yuny"
    assert_equal "41521", KeyStringCracker.new(message, date).key_string
  end

  it "returns a key object with necessary key when asked" do
    date = "020315"
    message = "yuny"
    key = KeyStringCracker.new(message, date).key
    assert_equal [41,15,52,21], key.key_offsets
    assert_equal [9,2,2,5], key.date_offsets
  end
end
