class Money
  attr_accessor :amount

  class << self
    def dollar(amount)
      Dollar.new(amount)
    end

    def franc(amount)
      Franc.new(amount)
    end
  end

  def == (object)
    money = object
    amount == money.amount && self.class == money.class
  end
end
