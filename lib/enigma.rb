require_relative "encryptor"
require_relative "key"
require_relative "message_cracker"
require_relative "key_string_cracker"

class Enigma
  ALPHABET = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  def encrypt(message, key, date)
    Encryptor.new(message, Key.for(key,date)).encrypted_message
  end

  def decrypt(message, key, date)
    Encryptor.new(message, Key.for(key,date)).decrypted_message
  end

  def crack(message, date)
    MessageCracker.new(message,date).cracked_message
  end

  def crack_via_key_string(message, date)
    MessageCracker.new(message,date).cracked_message(KeyStringCracker)
  end
end
