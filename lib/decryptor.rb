require_relative "rotator"
class Decryptor
  attr_reader :key, :message

  def initialize(message, key)
    @message = message
    @key = key
  end

  def decrypted_message
    decrypted_slices.flatten.join
  end

  def decrypted_slices
    message.chars.each_slice(4).map do |chars|
      Rotator.new(chars,key.offsets,:reverse).rotated_chars
    end
  end
end
