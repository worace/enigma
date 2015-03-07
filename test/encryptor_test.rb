require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/encryptor"
require_relative "../lib/key"
require_relative "../lib/key_offset"
require_relative "../lib/date_offset"

describe Encryptor do
  it "encrypts a message using a key" do
    key = Key.for("41521","020315")
    assert_equal "2.ql", Encryptor.new("ruby",key).encrypted_message
  end

  it "decrypts a message using a key" do
    key = Key.for("41521","020315")
    assert_equal "ruby", Encryptor.new("2.ql",key).decrypted_message
  end
end
