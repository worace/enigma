require "./lib/encryptor"
require "./lib/key"

infile = ARGV[0]
outfile = ARGV[1]

message = File.read(infile)
key = Key.gen
output = Encryptor.new(message, key)


