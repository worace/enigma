require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/date_offset"

describe DateOffset do
  it "takes a string date and generates numeric offsets" do
    assert_equal [9,2,2,5], DateOffset.new("020315").offsets
  end
end
