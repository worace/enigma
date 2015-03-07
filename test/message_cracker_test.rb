require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/message_cracker"
require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/message_cracker"

describe MessageCracker do
  it "cracks a message given message and date" do
    assert_equal "nd..", MessageCracker.new("yuny","020315").cracked_message
  end
end
