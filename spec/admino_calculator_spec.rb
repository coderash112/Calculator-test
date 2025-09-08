require 'admino_calculator'
require 'rails_helper'

RSpec.describe AdminoCalculator, type: :model do
  let(:calculator) { AdminoCalculator.new }
  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end
  end
end
