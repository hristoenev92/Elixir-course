defmodule ReceiveExample do
# TODO new type of message - :foo, (only the atom :foo), which after being received prints "Done the first task"
# TODO default clause - catch all, toest :) and prints "Done the second task"
# TODO be able to receive unlimited messages
# TODO return a message
  def loop() do
    receive do
      {:answer, text} -> IO.puts(text)
      {:test, text} -> IO.puts("received " <> text)
      {sender, message} -> send(sender, {:answer, "Received: " <> message})
      :foo -> IO.puts("Done the first task")
      _ -> IO.puts("Done the second task")
    end
    loop()
  end
  
end

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
  
end

defmodule Ping_Pong do

  #Create a module with a function, that creates a process, that when it receives {:ping}, it prints “Ping”, change the awaited message to {:ping, send_to}. Make it send to the “send_to” process a message in the form of {:pong,        <its-own-pid>}, make it wait a second, before sending the message, create an absolutely identical function named pong, that does everything “Ping” does, but replaced with “pong”, Make them send messages backwards and forwardsDesign a  way to stop them

  def ping() do
    spawn fn ->
      receive do
        {:ping, pong} ->
          IO.puts("Ping")
          :timer.sleep(2000)
          send(pong, {:pong, ping()})
      end
    end
  end

  def pong() do
   spawn fn ->
      receive do
        {:pong, ping} ->
          IO.puts("Pong")
          :timer.sleep(2000)
          send(ping, {:ping, ping()})
      end
    end
  end

  def stop() do
    Process.exit(List.last(Process.list), :kill)
  end

end
