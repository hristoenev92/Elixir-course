defmodule Homework7 do

		#Using `Enum.reduce` find the largest number in a list of numbers
	def largest_num(list) do
		Enum.reduce(list, fn x, acc ->
			if x > acc do x else acc end
		end)
	end

		#Write a recursive function to calculate the power of a number
	def power_num(num , power) do
		power_num(num , power, num)
	end
	def power_num(num , power, result) do
		if power>1 do 
			power_num(num,power-1,result*num) 
		else
			result
		end
	end
	
		#Write a function to count the digits in a number
	
	def digits_count(num) do
		length(Integer.digits(num))
	end
	
		#Write a function, to find the greatest common denominator of two numbers

	def greatest_common_denominator(num1, num2) do
		greatest_common_denominator(num1, num2, num1)
	end
	def greatest_common_denominator(num1, num2, result) do
		if rem(num1, result)==0 && rem(num2, result)==0 do
			result
		else 
			greatest_common_denominator(num1, num2, result-1)
		end
	end
	
		#Find the sum of all the multiples of 3 or 5 below 1000.
	
	def sum_multiples(num) do
		sum_multiples(num-1, 0)
	end
	def sum_multiples(num, result) do
		if num==0 do
			result
		else
			if rem(num, 3)==0 || rem(num, 5)==0 do
				sum_multiples(num-1, result+num)
			else
				sum_multiples(num-1, result)
			end
		end
	end
		#By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
	
end