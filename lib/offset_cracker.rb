require_relative "rotator"
require_relative "key"
require_relative "key_offset"
require_relative "date_offset"

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
    DateOffset.new(date).offsets
  end

  def chars_minus_date_offset
    Rotator.new(key_chars, date_offsets, char_set).rotated_chars
  end

  def key
    Key.new(offsets,date_offsets)
  end

  def offsets
    chars_minus_date_offset.zip(CRACK_CHARS).map do |pair|
      encrypted_char, target_char = pair.first, pair.last
      possible_offsets.find do |offset|
        decrypted_index = (char_set.position(encrypted_char) + offset) % char_set.length
        char_set.char_at(decrypted_index) == target_char
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
