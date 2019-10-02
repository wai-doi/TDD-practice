describe 'Money' do
  it 'test multiplication' do
    five = Money.dollar(5)

    expect(five.times(2)).to eq Money.dollar(10)
    expect(five.times(3)).to eq Money.dollar(15)
  end

  it 'test equality' do
    expect(Money.dollar(5) == Money.dollar(5)).to be true
    expect(Money.dollar(5) == Money.dollar(6)).to be false

    expect(Money.franc(5) == Money.franc(5)).to be true
    expect(Money.franc(5) == Money.franc(6)).to be false

    expect(Money.dollar(5) == Money.franc(5)).to be false
  end

  it 'test franc multiplication' do
    five = Money.franc(5)

    expect(five.times(2)).to eq Money.franc(10)
    expect(five.times(3)).to eq Money.franc(15)
  end

  it 'test currency' do
    expect(Money.dollar(1).currency).to eq 'USD'
    expect(Money.franc(1).currency).to eq 'CHF'
  end

  it 'test difference class equality' do
    expect(Money.new(10, 'CHF') == Franc.new(10, 'CHF')).to eq true
  end
end
