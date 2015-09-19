require "minitest/spec"
require "minitest/autorun"
require_relative "../lib/date_offset"

describe DateOffset do
  it "takes a string date and generates numeric offsets" do
    assert_equal [9,2,2,5], DateOffset.new("020315").offsets
  end

  it "uses todays datestring if one is not provided" do
    assert_equal Time.now.strftime("%m%d%y"), DateOffset.new.date_string
  end
end
