require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/offset_cracker"
require_relative "../lib/encryptor"

describe OffsetCracker do
  it "finds the real key given a date and 4 key characters" do
    date = "020315"
    #raise Encryptor.new("nd..",Key.new("41521","020315")).encrypted_message.inspect
    message = "yuny"
    key = OffsetCracker.new(message, date).key
    #assert_equal date, key.date
    assert_equal "41521", key
  end
end
