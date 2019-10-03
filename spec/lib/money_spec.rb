describe 'Money' do
  it 'test multiplication' do
    five = Money.dollar(5)

    expect(five.times(2)).to eq Money.dollar(10)
    expect(five.times(3)).to eq Money.dollar(15)
  end

  it 'test equality' do
    expect(Money.dollar(5) == Money.dollar(5)).to be true
    expect(Money.dollar(5) == Money.dollar(6)).to be false

    expect(Money.dollar(5) == Money.franc(5)).to be false
  end

  it 'test currency' do
    expect(Money.dollar(1).currency).to eq 'USD'
    expect(Money.franc(1).currency).to eq 'CHF'
  end

  it 'test simplet addition' do
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, 'USD')
  end

  it 'test plus return sum' do
    five = Money.dollar(5)
    result = five.plus(five)
    sum = result
    expect(sum.augend).to eq five
    expect(sum.addend).to eq five
  end

  it 'test reduce sum' do
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, 'USD')
    expect(result).to eq Money.dollar(7)
  end

  it 'test reduce money' do
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), 'USD')
    expect(result).to eq Money.dollar(1)
  end

  it 'test reduce money different currency' do
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(Money.franc(2), 'USD')
    expect(result).to eq Money.dollar(1)
  end

  it 'test identity rate' do
    expect(Bank.new.rate('USD', 'USD')).to eq 1
  end

  it 'test mixed addition' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(five_bucks.plus(ten_francs), 'USD')
    expect(result).to eq Money.dollar(10)
  end

  it 'test sum plus money' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    sum = Sum.new(five_bucks, ten_francs).plus(five_bucks)
    result = bank.reduce(sum, 'USD')
    expect(result).to eq Money.dollar(15)
  end

  it 'test sum times' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    sum = Sum.new(five_bucks, ten_francs).times(2)
    result = bank.reduce(sum, 'USD')
    expect(result).to eq Money.dollar(20)
  end
end
