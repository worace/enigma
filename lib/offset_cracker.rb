require_relative "rotator"
require_relative "key"

class OffsetCracker
  CRACK_CHARS = ["n","d",".","."]
  attr_reader :date, :message
  def initialize(message, date)
    @date = date
    @message = message
  end

  def key
    key_chars = message.chars.last(4)
    date_offsets = Key.new("00000",date).offsets
    pre_date_chars = Rotator.new(key_chars, date_offsets, CharSet.new(:reverse)).rotated_chars

    pre_date_chars.zip(CRACK_CHARS).map do |pair|
      enc, char = pair
      cs = CharSet.new(:reverse)
      (0..(cs.length * 2 - 1)).find do |rotation|
        cs.char_at((cs.position(enc) + rotation) % cs.length) == char
      end
    end
  end
end
