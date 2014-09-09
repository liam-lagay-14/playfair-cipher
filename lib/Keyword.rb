class Keyword
  attr_accessor :keyword
  def initialize(keyword)
    @keyword = keyword

    raise ArgumentError, 'Keyword must contain a value' unless keyword.length > 0
  end

  def is_valid_keyword?
    (keyword =~ /^[A-Z]+$/) == 0
  end
end