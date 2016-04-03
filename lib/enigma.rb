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


students = ["horace", "lovisa", "mike"]

def rand_key
  5.times.map { (0..9).to_a.sample }.join("")
end

def date_string
  Date.today.strftime("%d%m%y")

end

def challenges
  ["update your key to be 6 digits", "update your char map to handle upper case letters", "update your key to be sourced from a key word rather than random key"]
end


stuff = students.map do |s|
  c = challenges.sample
  key = rand_key
  date = date_string
  {student: s,
   challenge: c,
   encryption_date: date,
   key: key,
   ciphertext: Encryptor.new(c, Key.new(key,date)).encrypted_message
  }
end


puts stuff
