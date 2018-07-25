defmodule Homework5 do

  #Write a recursive definition, that calculates the sum of list of integers. E.g. if you pass it [1, 2, 3, 4], it should return 10
  def listSum([head|tail]) do
    listSum(tail, head)
  end
  def listSum([head|tail], sum) do
    listSum(tail, head+sum)
  end
  def listSum([], sum) do
    sum
  end

  # Write a recursive definition of “length/1” (the function that calculates the length of a list)

  def listLenght([head|tail]) do
    listLenght(tail, 1)
  end
  def listLenght([head|tail], lenght) do
    listLenght(tail, lenght+1)
  end
  def listLenght([], lenght) do
    lenght
  end

  #Write a recursive function, that calculates the sum of all even items in a list (to compute the remainder of an integer division, you can use the function rem/2)

  def sumEven([head|tail]) do
    sumEven([head|tail], 0)
  end
  def sumEven([head|tail], sum) do
    if rem(head, 2) ==0 do
      sumEven(tail, sum+head)
    else
       sumEven(tail,sum)
    end
  end
  def sumEven([], sum) do
    sum
  end

  #Write a recursive function, that takes a list of strings, and return the uppercase version of all the strings, that start with “a” (case-insensitive)

  def listToUpper([head|tail]) do
    listToUpper([head|tail],[])
  end
  def listToUpper([head|tail], newList) do
    if String.at(head, 0) == "a" || String.at(head, 0) == "A" do
      listToUpper(tail, newList++[String.upcase(head)])
    else
      listToUpper(tail, newList)
    end
  end
  def listToUpper([], newList)do
    newList
  end

end
