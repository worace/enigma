require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/encryptor"
require_relative "../lib/key"

describe Encryptor do
  it "encrypts a message using a key" do
    key = Key.new("41521","020315")
    assert_equal "2.ql", Encryptor.new("ruby",key).encrypted_message
  end
end
