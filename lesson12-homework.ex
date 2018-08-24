defmodule Homework do

  # Spawn a process, that prints "Hello new lesson" to the console.
  def hello() do
    spawn fn -> IO.puts("Hello new lesson") end
  end

  # Spawn a process, that when passed a pid and number, should send to the pid the number doubled.
  def doubled() do
    receive do
      {sender, num} -> send(sender, num*2)
      number -> IO.puts(number)
    end
    doubled()
  end

  # Spawn a process, that when passed a pid and a function, executes the function and returns the result to the pid.
  def sendFunc() do
    receive do
      {sender, func} ->
        if is_function(func) do send(sender, func.())
        end
    end
    sendFunc()
  end
