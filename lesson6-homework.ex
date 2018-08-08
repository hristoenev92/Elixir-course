	#on a list of numbers, calculate the product of all of them
 
Enum.reduce([1, 2, 3, 4], 0, fn x, acc -> 
x+acc 
end) 

	#on a list of strings, concatenate all of them
 
Enum.reduce(["a", "b", "c"], "", fn x, acc -> 
acc<>x 
end)

	#on a list of numbers, remove the odd ones
Enum.reduce([1, 2, 3, 4, 5, 6], [], fn x, acc ->
if rem(x, 2)==0 do [x|acc] else acc
end end)


defmodule Homework6 do
		#Write a function, that tests if a list is empty, and returns `true`, `false`, or “This is not a list!”
	
	def empty_list(list) when is_list(list) do
	 if list==[] do true else false end # da stane s patternmatch
	end
	def empty_list(list) when not is_list(list) do "This is not a list!" # nqma nujda ot when not is_list
	end

		#Write a recursive function, that calculates the sum of all even numbers in a list, using guards

	def sum_even(list) do
		Enum.reduce(list, 0, fn x, acc ->
			if Integer.is_even(x) do acc+x else acc end
		end) 
	end

	def sum_even_recursive([head|tail]) do
		sum_even_recursive([head|tail], 0)
	end
	def sum_even_recursive([head|tail], sum) do
		if Integer.is_even(head) do
			sum_even_recursive(tail, sum+head)
		else
			sum_even_recursive(tail,sum)
		end
	end
	def sum_even_recursive([], sum) do
		sum
	end 

		#on a list of numbers, return all of them doubled
	def double_list(list) do
		Enum.reduce(list, [], fn x, acc ->
		 [x*2|acc]
		end)
	end	
	
		#on a list of numbers, return a list, consisting of the even ones, doubled
	def double_evens(list) do	
		Enum.reduce(list, [], fn x, acc ->
			if Integer.is_even(x) do [x*2|acc] else acc end
		end)
	end
end
		#The task is, to write a refrigerator application. It should be possible to add items to it, to remove items from it, to keep count of the number of products, that are the same:
		#Write a module `Refrigerator`
defmodule Refrigerator do
		
		#It should have a function `new`, that returns a new empty refrigerator, represented as an empty map
	def new() do
		%{}
	end
	
		#It should have a function `add`, that takes a refrigerator, an item and count, and returns a new refrigerator, that has the count to the appropriate key in the map. Otherwise it should add a new key to the refrigerator.
	def add(refrigerator, item, count) do
		if Map.has_key?(refrigerator, item) do
			Map.update!(refrigerator, item, &(&1 + count))
		else
			Map.put(refrigerator, item, count)
		end
	end
	
		#It should have a function `remove`, that takes a refrigerator, an item and count, and returns a new refrigerator, with the count removed from the key in the map. If the count is more than the number of items in the fridge, it should leave the item to 0
	def remove(refrigerator, item, count) do
		Map.update!(refrigerator, item, &(if (&1-count)<0 do 0 else (&1-count) end))# da se premahne item s count 0
	end
end
