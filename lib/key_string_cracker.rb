require_relative "rotator"
require_relative "key"

class KeyStringCracker
  CRACK_CHARS = ["n","d",".","."]
  attr_reader :date, :message
  def initialize(message, date)
    raise "TODO -- make this work for message lengths not divisible by 4" unless message.length % 4  == 0
    @date = date
    @message = message
  end

  def key
    Key.for(key_string,date)
  end

  def key_chars
    message.chars.last(4)
  end

  def key_string
    # keys are 5-digit strings "00000" to "99999"
    # try each one in combination with provided date
    # until we rotate encrypted message back to the
    # expected end characters
    ks = ("00000".."99999").find do |key_string|
      key = Key.for(key_string,date)
      Rotator.new(key_chars,key.offsets,CharSet.new(:reverse)).rotated_chars == CRACK_CHARS
    end

    raise "Oops, no key found for message #{message} and #{date} using key_chars #{key_chars}" unless ks
    ks
  end
end
