require 'beeramid'

describe Beeramid do
  describe '.calculate' do

    context 'with negative amount' do
      it 'returns zero' do
        expect(Beeramid.calculate(-1)).to eql(0)
      end
    end

    context 'with zero amount' do
      it 'returns zero' do
        expect(Beeramid.calculate(0)).to eql(0)
      end
    end

  end
end
