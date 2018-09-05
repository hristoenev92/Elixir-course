defmodule Calc do
  use GenServer

  def init(init_state) do
    {:ok, init_state}
  end

  def add_number(pid, number) do
    GenServer.call(pid, {:substract, number})
  end

  def handle_call({:add, number},_from, state) do
    new_number = number + state
    {:reply, new_number, new_number}
  end

  def substract_number(pid, number) do
    GenServer.call(pid, {:substract, number})
  end

  def handle_call({:substract, number},_from, state) do
    new_number =  state - number
    {:reply, new_number, new_number}
  end

  def multiply_number(pid, number) do
    GenServer.call(pid, {:multiply, number})
  end

  def handle_call({:multiply, number},_from, state) do
    new_number = number * state
    {:reply, new_number, new_number}
  end

  def divide_number(pid, number) do
    GenServer.call(pid, {:divide, number})
  end

  def handle_call({:divide, number},_from, state) do
    new_number =  state / number
    {:reply, new_number, new_number}
  end

  def func_number(pid, func) do
    GenServer.call(pid, {:transform,  func})
  end

  def handle_call({:transform,  func}, _from, state) do
    new_number = func.(state)
    {:reply, new_number, new_number}
  end

  def print_number(pid, func) do
    GenServer.call(pid, {:print,  func})
  end

  def handle_call({:print,  func}, _from, state) do
    new_number = func.(state)
    {:reply, new_number, state}
  end

  def status(pid) do
    GenServer.call(pid, {:state})
  end
  
  def handle_call({:state}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:add, number}, state) do
    new_state = number + state
    {:noreply, new_state}
  end

end

defmodule Refrigirator do
  use GenServer

  def init(%{}) do
    {:ok, %{}}
  end

  def add(pid, product, quantity) do
    GenServer.call(pid, {:add, product, quantity})
  end

  def status(pid) do
    GenServer.call(pid, {:status})
  end

  def take(pid, product, quantity) do
    GenServer.call(pid, {:take, product, quantity})
  end

  def handle_call({:add, product, quantity}, _from, state) do
    new_state = if Map.has_key?(state, product) do
      Map.update!(state, product, &(&1 + quantity))
    else
      Map.put(state, product, quantity)
    end
    {:reply, new_state, new_state}
  end

  def handle_call({:status}, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:take, product, quantity}, _from, state) do
    new_state = if (quantity>=Map.get(state, product)) do
      Map.delete(state, product)
    else
      Map.update!(state, product, &(&1-quantity))
    end
    {:reply, new_state, new_state}
  end

end
