class Money
  attr_accessor :amount, :currency

  class << self
    def dollar(amount)
      self.new(amount, 'USD')
    end

    def franc(amount)
      self.new(amount, 'CHF')
    end
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def == (object)
    money = object
    amount == money.amount && self.currency == money.currency
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end
end
