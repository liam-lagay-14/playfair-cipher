class Keyword
  attr_accessor :keyword
  def initialize(keyword)
    @keyword = keyword

    raise ArgumentError, 'Keyword must contain a value' if keyword.empty?
  end

  def is_valid_keyword?
    (keyword =~ /^[A-Z]{1,25}$/) == 0
  end
end