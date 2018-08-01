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
 if list==[] do true else false end
end
def empty_list(list) when not is_list(list) do "This is not a list!"
end

	#Write a recursive function, that calculates the sum of all even numbers in a list, using guards

end

//To be continued...