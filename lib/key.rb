class Key
  attr_reader :key, :date
  def initialize(key, date)
    @key = key.to_i
    @date = date.to_i
  end

  def offsets
    key_offsets.zip(date_offsets).map { |pair| pair.reduce(:+) }
  end

  def key_offsets
    overlapping_slices(key.to_s, 2).map(&:to_i)
  end

  def date_offsets
    (date ** 2).to_s.chars.last(4).map(&:to_i)
  end

  def overlapping_slices(string, length)
    if string.length >= length
      [string[0..(length-1)]] + overlapping_slices(string[1..-1], length)
    else
      []
    end
  end
end
