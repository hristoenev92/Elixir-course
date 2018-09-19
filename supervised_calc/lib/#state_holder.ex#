defmodule StateHolder do
  use GenServer

  alias __MODULE__

  def start_link(init_state) do
    GenServer.start_link(__MODULE__, init_state, name: __MODULE__)
  end

  def init(init_state) do
    {:ok, init_state}
  end

  def change_state(new_state) do
    GenServer.cast(__MODULE__, {:change, new_state}) 
  end

  def status() do
    GenServer.call(__MODULE__, {:status})
  end
  
  def handle_call({:status}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:change, received_state}, state) do
    {:noreply, received_state}
  end
  
end
