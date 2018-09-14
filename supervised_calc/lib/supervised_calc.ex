defmodule SupervisedCalc do
  use GenServer
  @moduledoc """
  Documentation for SupervisedCalc.
  """
  alias __MODULE__
  alias StateHolder
  
  def start_link(init_state) do
     GenServer.start_link(__MODULE__, init_state, name: __MODULE__)
  end
  
  def init(init_state) do
    {:ok, init_state}
  end

  def add_number(number) do
    GenServer.call(__MODULE__, {:add, number})
  end

  def status() do
    GenServer.call(__MODULE__, {:status})
  end

  def handle_call({:add, number},_from, state) do
    new_number = number + state
    StateHolder.change_state(new_number)
    {:reply, new_number, new_number}
  end

  def handle_call({:status}, _from, state) do
    {:reply, state, state}
  end
  
end
