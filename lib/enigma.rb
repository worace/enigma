require_relative "encryptor"
require_relative "key"
require_relative "offset_cracker"

class Enigma
  ALPHABET = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  def encrypt(message, key, date)
    Encryptor.new(message, Key.new(key,date)).encrypted_message
  end

  def decrypt(message, key, date)
    Encryptor.new(message, Key.new(key,date)).decrypted_message
  end

  def crack(message, date)
    k = OffsetCracker.new(message, date).key
    puts k
  end
end
