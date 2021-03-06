require_relative "rotator"
require_relative "key"

class OffsetCracker
  CRACK_CHARS = ["n","d",".","."]
  attr_reader :date, :message
  def initialize(message, date)
    @date = date
    @message = message
  end

  def key_chars
    message.chars.last(4)
  end

  def date_offsets
    Key.new("00000",date).offsets
  end

  def chars_minus_date_offset
    Rotator.new(key_chars, date_offsets, char_set).rotated_chars
  end

  def offsets
    chars_minus_date_offset.zip(CRACK_CHARS).map do |pair|
      enc, char = pair
      possible_offsets.find do |offset|
        decrypted_index = (char_set.position(enc) + offset) % char_set.length
        char_set.char_at(decrypted_index) == char
      end
    end
  end

  def possible_offsets
    # use twice the length of the char set in case the original
    # is behind the encrypted char and we need to wrap around
    (0..(char_set.length * 2 - 1))
  end

  def char_set
    CharSet.new(:reverse)
  end
end
