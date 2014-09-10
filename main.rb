require_relative 'lib/encryption_cipher'
require_relative 'lib/digraph'

puts 'PLAYFAIR CIPHER EXERCISE by Liam Lagay'

puts '>>>>>>>>>>>>>>'

raise ArgumentError, 'Please provide a message and keyword' if (ARGV[0].nil? || ARGV[1].nil?)

encryption_cipher = EncryptionCipher.new(ARGV[0], ARGV[1])

puts encryption_cipher.message
puts encryption_cipher.digraph.keyword.keyword

puts '>>>>>>>>>>>>>>'

encrypted_message = encryption_cipher.encrypt_message

puts encrypted_message

puts '>>>>>>>>>>>>>>'

decrypted_message = encryption_cipher.decrypt_message(encrypted_message)

puts decrypted_message

puts '>>>>>>>>>>>>>>'