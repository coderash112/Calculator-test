class AdminoCalculator
  def add(numbers)
    0
    return 0 if numbers.empty?
    numbers.to_i
    numbers.split(',').map(&:to_i).sum
  end
end

calculator = AdminoCalculator.new
puts calculator.add("")
puts calculator.add("1")
puts calculator.add("1,5")
puts calculator.add("1\n5,3,6")