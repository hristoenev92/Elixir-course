defmodule Homework5 do

  #Write a recursive definition, that calculates the sum of list of integers. E.g. if you pass it [1, 2, 3, 4], it should return 10
  def list_sum([head|tail]) do
    list_sum(tail, head)
  end
  def list_sum([head|tail], sum) do
    list_sum(tail, head+sum)
  end
  def list_sum([], sum) do
    sum
  end

  # Write a recursive definition of “length/1” (the function that calculates the length of a list)

  def list_lenght([head|tail]) do
    list_lenght(tail, 1)
  end
  def list_lenght([head|tail], lenght) do
    list_lenght(tail, lenght+1)
  end
  def list_lenght([], lenght) do
    lenght
  end

  #Write a recursive function, that calculates the sum of all even items in a list (to compute the remainder of an integer division, you can use the function rem/2)

  def sum_even([head|tail]) do
    sum_even([head|tail], 0)
  end
  def sum_even([head|tail], sum) do
    if rem(head, 2) ==0 do
      sum_even(tail, sum+head)
    else
       sum_even(tail,sum)
    end
  end
  def sum_even([], sum) do
    sum
  end

  #Write a recursive function, that takes a list of strings, and return the uppercase version of all the strings, that start with “a” (case-insensitive)

  def list_to_upper([head|tail]) do
    list_to_upper([head|tail],[])
  end
  def list_to_upper([head|tail], newList) do
    if String.at(head, 0) == "a" || String.at(head, 0) == "A" do
      list_to_upper(tail, newList++[String.upcase(head)])
    else
      list_to_upper(tail, newList)
    end
  end
  def list_to_upper([], newList)do
    newList
  end

end
