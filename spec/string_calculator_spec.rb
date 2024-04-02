# spec/string_calculator_spec.rb

require 'string_calculator'
require 'byebug'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(StringCalculator.add('1')).to eq(1)
    end

    it 'returns the sum for two numbers' do
      expect(StringCalculator.add('1,5')).to eq(6)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'allows changing delimiter' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      expect { StringCalculator.add('1,-2,3,-4') }.to raise_error('Negative numbers not allowed: -2, -4')
    end
  end
end
