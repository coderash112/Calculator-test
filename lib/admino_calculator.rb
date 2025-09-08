class AdminoCalculator
  def add(numbers)
   return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      numbers = parts[1]
    end

    numbers = numbers.gsub("\n", delimiter)
    num_list = numbers.split(delimiter)

    negatives = num_list.select { |n| n.to_i < 0 }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    num_list.map(&:to_i).reduce(0, :+)
  end
end

calculator = AdminoCalculator.new
puts calculator.add("")
puts calculator.add("1")
puts calculator.add("1,5")
puts calculator.add("1\n5,3,6")
puts calculator.add("//;\n1;5")
begin
  puts calculator.add("1,-2,3")
rescue => e
  puts e.message
end
begin
  puts calculator.add("//;\n1;-2;3")
rescue => e
  puts e.message
end


# Alternatively we use the below code to generate the string calculator 


# class StringCalculator
#   def self.add(numbers)
#     return 0 if numbers.empty?
#     if numbers.start_with?("//")
#       delimiter = numbers[2]
#       numbers = numbers[4..]
#     else
#       delimiter = /,|\n/
#     end

#     num_array = numbers.split(delimiter).map(&:to_i)
#     negatives = num_array.select { |n| n < 0 }
#     unless negatives.empty?
#       raise "negative numbers not allowed: #{negatives.join(', ')}"
#     end

#     num_array.sum
#   end
# end