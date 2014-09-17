def bruteForce range
	sum = 0
	fib = [1, 2, 3]
	pointer = fib.length

	while fib[pointer - 1] <= range
		fib.push(fib[pointer - 1] + fib[pointer - 2])
		pointer += 1
	end

	for i in 0...(pointer - 1)
		if fib[i] % 2 == 0
			sum += fib[i]
		end
	end

	return sum
end

def refinedSolution range
	sum = 0
	fib = [0, 1]
	next_fib = 0

	while next_fib <= range
		next_fib = fib[0] + fib[1]
		if next_fib % 2 == 0 and next_fib <= range
			sum += next_fib
		end

		fib[0] = fib[1]
		fib[1] = next_fib
	end

	return sum
end

def compareSolutions range
	puts "Sum of the Even Fibonacci Numbers below " + range.to_s

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