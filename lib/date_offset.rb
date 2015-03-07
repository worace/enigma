class DateOffset
  attr_reader :date_string
  def initialize(date_string)
    @date_string = date_string
  end

  def offsets
    (date_string.to_i ** 2).to_s.chars.last(4).map(&:to_i)
  end
end
