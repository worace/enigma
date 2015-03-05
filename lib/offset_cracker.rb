require_relative "rotator"

class OffsetCracker
  CRACK_CHARS = ["n","d",".","."]
  def initialize(date, message)
    @date = date
    @message = message
  end

  # get date offsets
  # ask rotator for distance b/t final 4 message chars and "nd.."
  # using calculated date offsets
  # -- use Key to get date offsets?
  # -- use rotator to simplify distance calc by rotating
  # on just the date offset? (so remaining offset is key offset)

  def offset(date, message)
    key_chars = message.chars.last(4)
    CRACK_CHARS.zip(key_chars).map { |pair| Rotator.distance(*p) }
  end
end
