require_relative 'lib/encryption_cipher'
require_relative 'lib/message'
require_relative 'lib/digraph'

puts 'PLAYFAIR CIPHER EXERCISE by Liam Lagay'

puts '>>>>>>>>>>>>>>'

encryption_cipher = EncryptionCipher.new('Meet me at the Hammersmith Bridge tonight', 'CHARLES')

puts encryption_cipher.message_to_encrypt.message
puts encryption_cipher.digraph.keyword.keyword

puts '>>>>>>>>>>>>>>'

encrypted_message = encryption_cipher.encrypt_message

puts encrypted_message

puts '>>>>>>>>>>>>>>'

decrypted_message = encryption_cipher.decrypt_message(encrypted_message)

puts decrypted_message

puts '>>>>>>>>>>>>>>'