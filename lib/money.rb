class Money
  attr_accessor :amount, :currency

  class << self
    def dollar(amount)
      Dollar.new(amount, 'USD')
    end

    def franc(amount)
      Franc.new(amount, 'CHF')
    end
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def == (object)
    money = object
    amount == money.amount && self.class == money.class
  end
end
