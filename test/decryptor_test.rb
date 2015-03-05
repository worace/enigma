require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/decryptor"
require_relative "../lib/key"

describe Decryptor do
  it "decrypts a message using a key" do
    key = Key.new("41521","020315")
    assert_equal "ruby", Decryptor.new("2.ql",key).decrypted_message
  end
end
