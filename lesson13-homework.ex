defmodule Refrigirator do

  def start() do
    spawn(fn -> refrigirator(%{}) end)
  end

  def refrigirator(map) do
    receive do
      {:add, product, quantity} ->
        map = if Map.has_key?(map, product) do
           Map.update!(map, product, &(&1 + quantity))
        else
           Map.put(map, product, quantity)
        end
        refrigirator(map)
      {:status} ->
        IO.inspect(map)
        refrigirator(map)
      {:take, product, quantity} ->
        map = if quantity>=Map.get(map, product) do
          Map.delete(map, product)
        else
          Map.update!(map, product, &(&1-quantity))
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
