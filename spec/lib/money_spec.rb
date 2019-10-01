describe 'Money' do
  it 'test multiplication' do
    five = Dollar.new(5)

    product = five.times(2)
    expect(product.amount).to eq 10

    product = five.times(3)
    expect(product.amount).to eq 15
  end

  it 'test equality' do
    expect(Dollar.new(5) == Dollar.new(5)).to be true
    expect(Dollar.new(5) == Dollar.new(6)).to be false
  end
end
