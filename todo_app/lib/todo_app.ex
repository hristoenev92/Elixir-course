defmodule TodoApp do
  @moduledoc """
  Documentation for TodoApp.
  """
  def new() do
    []
  end

  def add(todo_list,{id, text, date, completed}) do
    [%{id: id, text: text, date: date, status: completed} | todo_list]
  end

  def find(todo_list, id) do
    Enum.filter(todo_list, fn %{id: x} ->
      x == id
     end)
  end

  def remove(todo_list, id) do
       remove(todo_list, id, Enum.filter(todo_list, fn %{id: x} ->
         x == id
       end))
  end

  def remove(todo_list, id, [head | tail]) do
    List.delete(todo_list, head)
  end

end
