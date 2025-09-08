require 'admino_calculator'
require 'rails_helper'

RSpec.describe AdminoCalculator, type: :model do
  let(:calculator) { AdminoCalculator.new }
  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end
    it "If only a single number is given, it returns that number itself." do
      expect(calculator.add("1")).to eq(1)
    end
    it "If two numbers are provided, separated by a comma, it returns their sum" do
      expect(calculator.add("1,5")).to eq(6)
    end
    it "handles new lines between numbers and more than two numbers" do
      expect(calculator.add("1\n2,3,8")).to eq(12)
    end
    it "supports different types of delimiters" do
      expect(calculator.add("//;\n1;5")).to eq(6)
    end
    it "raises an exception for negative numbers" do
      expect { calculator.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
    end
    it "raises an exception listing all negative numbers" do
      expect { calculator.add("1,-2,-3,4") }.to raise_error("Negative numbers not allowed: -2, -3")
    end
  end
end


# require 'string_calculator'

# RSpec.describe StringCalculator do
#   describe '.add' do
#     it 'returns 0 for an empty string' do
#       expect(StringCalculator.add("")).to eq(0)
#     end

#     it 'returns the number itself if only one number is provided' do
#       expect(StringCalculator.add("1")).to eq(1)
#     end

#     it 'returns the sum of two numbers' do
#       expect(StringCalculator.add("1,2")).to eq(3)
#     end

#     it 'returns the sum of multiple numbers' do
#       expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
#     end

#     it 'handles new lines between numbers' do
#       expect(StringCalculator.add("1\n2,3")).to eq(6)
#     end

#     it 'supports different delimiters' do
#       expect(StringCalculator.add("//;\n1;2")).to eq(3)
#     end

#     it 'raises an error for negative numbers' do
#       expect { StringCalculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
#     end

#     it 'raises an error for multiple negative numbers' do
#       expect { StringCalculator.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
#     end

#   end
# end