class Money
  attr_accessor :amount

  def == (object)
    money = object
    amount == money.amount && self.class == money.class
  end
end
