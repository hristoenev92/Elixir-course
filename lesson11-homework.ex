defmodule ReceiveExample do

  def loop do
    receive do
      {:answer, text} -> IO.puts(text)
      {:test, text} -> IO.puts("received " <> text)
      {sender, message} -> send(self(), {:answer, "Received: " <> message})
      :foo -> IO.puts("Done the first task")
      _ -> IO.puts("Done the second task")
    after
      1000->"recieved nothing"
    end
  end

end
