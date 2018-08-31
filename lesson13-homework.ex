defmodule Refrigirator do

  def start() do
    spawn(fn -> refrigirator(%{}) end)
  end

  def refrigirator(map) do
    receive do
      {:add, product, quantity} ->
        if Map.has_key?(map, product) do
          map = Map.update!(map, product, &(&1 + quantity))
        else
          map =  Map.put(map, product, quantity)
        end
        refrigirator(map)
      {:status} ->
        IO.inspect(map)
        refrigirator(map)
      {:take, product, quantity} ->
        if quantity>=Map.get(map, product) do
          map = Map.delete(map, product)
        else
          map = Map.update!(map, product, &(&1-quantity))
        end
        refrigirator(map)
    end
  end

  def add(pid, product, qunatity) do
    send(pid, {:add , product , qunatity})
  end

  def status(pid) do
    send(pid, {:status})
  end

  def take(pid, product, quantity) do
    send(pid, {:take, product, quantity})
  end

end
