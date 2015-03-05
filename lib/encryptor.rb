require_relative "rotator"
class Encryptor
  attr_reader :key, :message

  def initialize(message, key)
    @message = message
    @key = key
  end

  def decrypted_message
    rotated_message(:reverse).join
  end

  def encrypted_message
    rotated_message(:forward).join
  end

  def rotated_message(dir)
    message.chars.each_slice(4).flat_map do |chars|
      Rotator.new(chars,key.offsets,dir).rotated_chars
    end
  end
end
