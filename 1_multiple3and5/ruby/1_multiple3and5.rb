def bruteForce range
	sum = 0

	for i in 1...range
		if i % 3 == 0 or i % 5 == 0
			sum += i
		end
	end

	return sum
end

def refinedSolution range
	shorten_range = range / 3
	if range % 3 != 0
		shorten_range += 1
	end

	sum = 0
	mult_of_three = 0
	mult_of_five = 0

	for i in 1...shorten_range
		mult_of_three = i * 3
		mult_of_five = i * 5

		if mult_of_five < range and mult_of_five % 3 != 0
			sum += mult_of_five
		end

		sum += mult_of_three
	end

	return sum
end

def compareSolutions range
	puts "Sum of the multiple of 3 and 5 below " + range.to_s

	start_time = Time.new
	result = bruteForce range
	end_time = Time.new

	puts "Calling Brute-force Solution:"
	puts "\tSum: " + result.to_s
	puts "\tTime Used (ms): " + ((end_time - start_time)*1000).to_s

	start_time = Time.new
	result = refinedSolution range
	end_time = Time.new

	puts "Calling Refined Solution:"
	puts "\tSum: " + result.to_s
	puts "\tTime Used (ms): " + ((end_time - start_time)*1000).to_s
end

puts "Enter the range: "
range = gets.chomp.to_i
compareSolutions range