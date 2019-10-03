class Pair
  attr_reader :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end

  def eql?(object)
    pair = object
    from == pair.from && to == pair.to
  end

  def hash
    0
  end
end
