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
