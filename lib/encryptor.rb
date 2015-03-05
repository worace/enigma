class Encryptor
  attr_reader :key, :message

  def initialize(message, key)
    @message = message
    @key = key
  end

  def encrypted_message
    message.chars.each_slice(4).map do |chars|
      Rotator.new(chars,key.offsets).rotated_chars
    end
  end
end
