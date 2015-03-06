require_relative "rotator"
require_relative "key"

class OffsetCracker
  CRACK_CHARS = ["n","d",".","."]
  attr_reader :date, :message
  def initialize(message, date)
    @date = date
    @message = message
  end

  # get date offsets
  # ask rotator for distance b/t final 4 message chars and "nd.."
  # using calculated date offsets
  # -- use Key to get date offsets?
  # -- use rotator to simplify distance calc by rotating
  # on just the date offset? (so remaining offset is key offset)

  #"nd.." -> "yuny"
  # Date Offsets: 9225
  # "nd.." -> 9 2 2 5 -> "wfad"
  # Distances: [11, 17, 24, 13]
  # "wfad" -> 41 15 52 21 -> "yuny"
  #
  # "yuny" -> -9 -2 -2 -5 -> "pslt"
  # "pslt" -> -41 -15 -52 -21 -> "nd.."
  # Key Offsets: ?? (41521 -> [41,15,52,21])
  # Total Offsets: 50,17,54,26
  def key
    key_chars = message.chars.last(4)
    date_offsets = Key.new("00000",date).offsets

    pre_date_chars = Rotator.new(key_chars, date_offsets, CharSet.new(:reverse)).rotated_chars

    #pre_date_chars + reversed key offsets == "nd.."
    #p -> n (2 or 41)
    #s -> d (15 or 54)
    #l -> . (26 or 65)
    #t -> . (18 or 57)
    #["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    #key: [2, 15, 26, 18]; objective: 41 15 52 21
    #chars = Rotator.new(pre_date_charse, [????],CharSet.new(:reverse)).rotated_chars
    key = CRACK_CHARS.zip(pre_date_chars).map do |pair|
      CharSet.new(:reverse).distance(*pair)
    end
    raise key.inspect
    Key.new(key.map(&:to_s).join,date)
  end
end