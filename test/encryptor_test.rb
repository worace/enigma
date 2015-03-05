require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/encryptor"
require_relative "../lib/key"

describe Encryptor do
  before do
    @key = Key.new(11111,020315)
  end
  #example usage:
  #ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
  it "finds the date_offset for the date" do
    skip
    assert_equal 9225, Encryptor.new("",@key).date_offset
  end
end
