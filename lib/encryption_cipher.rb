class EncryptionCipher
  attr_accessor :message_pairs
  attr_reader :message, :digraph

  def initialize(message, keyword)
    raise ArgumentError, 'Please provide a message and keyword' if message.empty? || keyword.empty?

    @message = message
    @digraph = Digraph.new(keyword)
    @message_pairs = []
  end

  def encrypt_message
    encrypted_message_pairs = []

    message_pairs = split_message_into_pairs(message, true)

    message_pairs.each do |message_pair|
      character_one = digraph.locate_character_in_digraph(message_pair[0])
      character_two = digraph.locate_character_in_digraph(message_pair[1])

      encrypted_character_one, encrypted_character_two = get_characters(character_one, character_two, true)
      encrypted_message_pairs << [encrypted_character_one, encrypted_character_two]
    end
    encrypted_message_pairs.join('')
  end

  def decrypt_message(encrypted_message)
    decrypted_message_pairs = []
    message_pairs = split_message_into_pairs(encrypted_message, false)

    message_pairs.each do |message_pair|
      character_one = digraph.locate_character_in_digraph(message_pair[0])
      character_two = digraph.locate_character_in_digraph(message_pair[1])

      decrypted_character_one, decrypted_character_two = get_characters(character_one, character_two, false)
      decrypted_message_pairs << [decrypted_character_one, decrypted_character_two]
    end
    decrypted_message_pairs.join('')
  end

  def get_characters(character_one, character_two, is_encryption)

    # If on same row and we are encrypting - move one to the right of the grid. Otherwise, move one to the left.
    if exist_on_same_row?(character_one, character_two)
      transformed_character_one = digraph.get_character_in_given_row_and_column(character_one[:row], (is_encryption ? character_one[:column] + 1 : character_one[:column] - 1))
      transformed_character_two = digraph.get_character_in_given_row_and_column(character_two[:row], (is_encryption ? character_two[:column] + 1 : character_two[:column] -1))
    # If on the same column and we are encrypting, move one down in the grid. Otherwise, move one up!
    elsif exist_on_same_column?(character_one, character_two)
      transformed_character_one = digraph.get_character_in_given_row_and_column((is_encryption ? character_one[:row] + 1 : character_one[:row] -1), character_one[:column])
      transformed_character_two = digraph.get_character_in_given_row_and_column((is_encryption ? character_two[:row] + 1 : character_two[:row] -1), character_two[:column])
    else
      transformed_character_one = digraph.get_character_in_given_row_and_column(character_one[:row], character_two[:column])
      transformed_character_two = digraph.get_character_in_given_row_and_column(character_two[:row], character_one[:column])
    end
    return transformed_character_one, transformed_character_two
  end

  private

  def split_message_into_pairs(message, is_encryption)
    # transform all characters to uppercase, remove whitespace and then split them into the appropriate string
    list_of_characters = message.upcase.gsub(/\s+/, '').split('')

    list_of_characters.each_with_index do |character, index|
      list_of_characters[index] = 'I' if list_of_characters[index] == 'J'
      next_character = list_of_characters[index + 1]
      # append an X to the array if a character matches AND WE ARE ENCRYPTING!!!
      append_x_character_to_array(list_of_characters, index + 1) if (next_character == character && is_encryption)
    end

    # append an X to the array if there are an odd number of characters
    append_x_character_to_array(list_of_characters, list_of_characters.size) if (list_of_characters.size.odd? && is_encryption)

    # slice list of characters into pairs and return the array for use
    list_of_characters.each_slice(2).to_a
  end

  def append_x_character_to_array(list_of_characters, index)
    list_of_characters.insert(index, 'X')
  end

  def exist_on_same_row?(character_one, character_two)
    character_one[:row] == character_two[:row]
  end

  def exist_on_same_column?(character_one, character_two)
    character_one[:column] == character_two[:column]
  end
end