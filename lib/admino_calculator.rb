class AdminoCalculator
  def add(numbers)
    0
    return 0 if numbers.empty?
    numbers.to_i
  end
end

calculator = AdminoCalculator.new
puts calculator.add("")
puts calculator.add("1")
