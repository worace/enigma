require_relative "offset_cracker"
require "pry"
class MessageCracker
  attr_reader :message, :date

  def initialize(message, date)
    @message = message
    @date = date
  end

  def key
    OffsetCracker.new(message, date).key
  end

  def cracked_message
    Rotator.new(message.chars,key.offsets,CharSet.new(:reverse)).rotated_chars.join
  end
end
