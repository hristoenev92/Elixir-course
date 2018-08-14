defmodule Homework9 do
		
	def all_true(list, func) do
		if Enum.find(list, fn x -> func.(x) == false end) do
			false
		else 
			true
		end
	end
  
	def any_true(list, func) do
		if Enum.find(list, fn x -> func.(x) == true end) do
			true
		else
			false
		end
	end
  
	def get_element_at(list, item, value) do
		Enum.at(list, item, value)
	end
	
	def max_by(list, func) do
		Enum.max_by(list, fn x -> func.(x) end)
	end
	
	def take_first_n(list, n) do
		Enum.take(list, n)
	end
	
end

