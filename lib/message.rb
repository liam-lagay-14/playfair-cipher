class Message
  attr_accessor :message
  attr_reader :message_pairs
  def initialize(message)
    @message = message
    raise ArgumentError, 'Message must be provided' if message.empty?

    @message_pairs = split_message_into_pairs
  end

  private

  def split_message_into_pairs
    # transform all characters to uppercase, remove whitespace and then split them into the appropriate string
    list_of_characters = message.upcase.gsub(/\s+/, '').split('')

    list_of_characters.each_with_index do |character, index|
      next_character = list_of_characters[index + 1]
      # append an X to the array if a character matches
      append_x_character_to_array(list_of_characters, index + 1) if next_character == character
    end

    # append an X to the array if there are an odd number of characters
    append_x_character_to_array(list_of_characters, list_of_characters.size) if list_of_characters.size.odd?

    # slice list of characters into pairs and return the array for use
    list_of_characters.each_slice(2).to_a
  end

  private

  def append_x_character_to_array(list_of_characters, index)
    list_of_characters.insert(index, 'X')
  end
end