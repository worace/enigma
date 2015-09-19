require_relative "key_offset"
require_relative "date_offset"

class Key
  attr_reader :key_offsets, :date_offsets
  def initialize(key_offsets, date_offsets)
    @key_offsets = key_offsets
    @date_offsets = date_offsets
  end

  def self.for(key_string,date_string)
    new(KeyOffset.new(key_string).offsets, DateOffset.new(date_string).offsets)
  end

  def self.gen
    new(Key.new, DateOffset.new)
  end

  def offsets
    key_offsets.zip(date_offsets).map { |pair| pair.reduce(:+) }
  end
end
