require_relative "lib/caesar_cipher"

puts "Enter the shift value:"
shift = Integer(gets)

puts "Enter the string to encrypt"
message = gets

cipher = CaesarCipher.new(shift)
puts "Encrypted message"
puts cipher.encrypt(message)