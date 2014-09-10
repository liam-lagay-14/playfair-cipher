class Keyword
  attr_accessor :keyword
  def initialize(keyword)
    @keyword = remove_duplicates_and_sub_character_if_needed(keyword)

    raise ArgumentError, 'Keyword must contain upper case characters only' unless is_valid_keyword?
    raise ArgumentError, 'Keyword must contain a value' if keyword.empty?
  end

  private

  def is_valid_keyword?
    (keyword =~ /^[A-Z]+$/) == 0
  end

  def remove_duplicates_and_sub_character_if_needed(keyword_to_process)
    unique_keyword = ''

    keyword_characters = keyword_to_process.chars.uniq.to_a

    keyword_characters.each do |character|
       unique_keyword += character
    end
    # sub J for I at the end (I is repeated twice in the grid if and only if J is present)
    unique_keyword.sub('J', 'I')
  end
end