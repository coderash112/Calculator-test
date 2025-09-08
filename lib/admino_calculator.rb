class AdminoCalculator
  def add(numbers)
    0
    return 0 if numbers.empty?
    numbers.to_i
    numbers.split(',').map(&:to_i).sum
    delimiter = ","
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..]
    else
      delimiter = /,|\n/
    end
      numbers = numbers.split(delimiter).map(&:to_i).sum
  end
end

calculator = AdminoCalculator.new
puts calculator.add("")
puts calculator.add("1")
puts calculator.add("1,5")
puts calculator.add("1\n5,3,6")
puts calculator.add("//;\n1;5")