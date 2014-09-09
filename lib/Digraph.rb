require_relative 'Keyword'

class Digraph

  attr_accessor :keyword, :digraph_array, :row_array

  # As per the playfair-cipher definition, the array is always of a length of 5 x 5, therefore
  # setting a constant in this case.
  ARRAY_SIZE = 5

  def initialize(keyword)
    @keyword = Keyword.new(keyword)
    @digraph_array = []
    @row_array = []
    populate_digraph
  end

  private

  def populate_digraph
    keyword.keyword.split('').each do |character|
      row_array << character
      add_to_digraph_array_if_row_full
    end
    populate_digraph_with_alphabet_characters
  end

  def populate_digraph_with_alphabet_characters
    alphabet_array = ('A'..'Z').to_a
    alphabet_array.delete('J')
    alphabet_array.each do |character|
      unless keyword.keyword.include? character
        row_array << character
        add_to_digraph_array_if_row_full
      end
    end
  end

  def add_to_digraph_array_if_row_full
    if row_array.size == ARRAY_SIZE
      digraph_array << row_array
      @row_array = []
    end
  end

end