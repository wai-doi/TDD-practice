describe 'Money' do
  it 'test multiplication' do
    five = Dollar.new(5)

    expect(five.times(2)).to eq Dollar.new(10)
    expect(five.times(3)).to eq Dollar.new(15)
  end

  it 'test equality' do
    expect(Dollar.new(5) == Dollar.new(5)).to be true
    expect(Dollar.new(5) == Dollar.new(6)).to be false
  end
end
