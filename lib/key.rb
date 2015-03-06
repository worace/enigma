class Key
  attr_reader :key, :date
  def initialize(key, date)
    @key = key.chars
    @date = date.chars
  end

  def offsets
    key_offsets.zip(date_offsets).map { |pair| pair.reduce(:+) }
  end

  def key_offsets
    overlapping_slices(key, 2).map { |pair| pair.join.to_i }
  end

  def date_offsets
    (date.join.to_i ** 2).to_s.chars.last(4).map(&:to_i)
  end

  def overlapping_slices(chars, length)
    if chars.length >= length
      [chars.first(2)] + overlapping_slices(chars[1..-1], length)
    else
      []
    end
  end
end
