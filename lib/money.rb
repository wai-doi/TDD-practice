class Money
  attr_accessor :amount

  def == (object)
    money = object
    amount == money.amount
  end
end
