def isPrime num
	for i in 2...num
		if num % i == 0
			return false
		end
	end

	return true
end

def bruteForce input
	possible = input - 1

	while possible > 1
		if input % possible == 0 and isPrime(possible)
			return possible
		end

		possible -= 1
	end

	return input
end

def findMax x, y
	if x > y
		return x
	else
		return y
	end
end

def sqrtSolution input
	sqrt = Math.sqrt(input).round

	while sqrt > 1
		if input % sqrt == 0
			if isPrime(sqrt) and isPrime(input/sqrt)
				return findMax(sqrt, input/sqrt)
			elsif isPrime(input/sqrt)
				return input/sqrt
			elsif isPrime(sqrt)
				return sqrt
			end
		end

		sqrt -= 1
	end

	return input
end

def recursionSolution input, limit_input
	limit = limit_input

	for i in 2...limit
		if input % i == 0 and isPrime(input/i)
			return input/i
		elsif input % i == 0
			limit = recursionSolution(input/i, limit)
		end
	end

	return limit
end

def compareSolutions range
	puts "Find the Largest Prime Factor of " + range.to_s

	if range < 999999999
		start_time = Time.new
		result = bruteForce range
		end_time = Time.new

		puts "Calling Brute-force Solution:"
		puts "\tLargest Prime: " + result.to_s
		puts "\tTime Used (ms): " + ((end_time - start_time)*1000).to_s
	end

	start_time = Time.new
	result = sqrtSolution range
	end_time = Time.new

	puts "Calling Square Solution:"
	puts "\tLargest Prime: " + result.to_s
	puts "\tTime Used (ms): " + ((end_time - start_time)*1000).to_s

	start_time = Time.new
	result = recursionSolution(range, range)
	end_time = Time.new

	puts "Calling Recursion Solution:"
	puts "\tLargest Prime: " + result.to_s
	puts "\tTime Used (ms): " + ((end_time - start_time)*1000).to_s
end

puts "Enter the range: "
range = gets.chomp.to_i
compareSolutions range