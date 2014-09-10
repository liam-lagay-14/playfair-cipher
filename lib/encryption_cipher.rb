class EncryptionCipher
  attr_accessor :encrypted_pairs
  attr_reader :message_to_encrypt, :digraph

  def initialize(message, keyword)
    @message_to_encrypt = Message.new(message)
    @digraph = Digraph.new(keyword)

    @encrypted_pairs = encrypt_message(message_to_encrypt.message_pairs)
  end

  def encrypt_message(message_pairs)
    encrypted_message_pairs = []
    message_pairs.each do |message_pair|
      character_one = digraph.locate_character_in_digraph(message_pair[0])
      character_two = digraph.locate_character_in_digraph(message_pair[1])

      encrypted_character_one, encrypted_character_two = get_encrypted_characters(character_one, character_two)
      encrypted_message_pairs << [encrypted_character_one, encrypted_character_two]
    end
    encrypted_message_pairs
  end

  def get_encrypted_characters(character_one, character_two)
    # Step 1 - is the message pair in the same row? If so, get the character from the next column along (shifted to the
    # start if we reach the end of the array)

    # Step 2 - is the message pair in the same column? If so, get the character from the next row down (shifted to the top
    # if we reach the end of the array)

    # Step 3 - For first letter, go along the row and get the character that intersects the column containing the
    # second letter. For second character, go along the column and get the character that intersects the row
    # containing the first letter

    # TODO - Still not entirely convinced by this approach - review needed.

    if exist_on_same_row?(character_one, character_two)
      encrypted_character_one = digraph.get_character_in_given_row_and_column(character_one[:row], character_one[:column] + 1)
      encrypted_character_two = digraph.get_character_in_given_row_and_column(character_two[:row], character_two[:column] + 1)
    elsif exist_on_same_column?(character_one, character_two)
      encrypted_character_one = digraph.get_character_in_given_row_and_column(character_one[:row] + 1, character_one[:column])
      encrypted_character_two = digraph.get_character_in_given_row_and_column(character_two[:row] + 1, character_two[:column])
    else
      encrypted_character_one = digraph.get_character_in_given_row_and_column(character_one[:row], character_two[:column])
      encrypted_character_two = digraph.get_character_in_given_row_and_column(character_two[:row], character_one[:column])
    end
    return encrypted_character_one, encrypted_character_two
  end

  private

  def exist_on_same_row?(character_one, character_two)
    character_one[:row] == character_two[:row]
  end

  def exist_on_same_column?(character_one, character_two)
    character_one[:column] == character_two[:column]
  end
end