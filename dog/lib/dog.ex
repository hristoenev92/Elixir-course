defmodule Dog do
  @moduledoc """
  Documentation for Dog.
  """

  def get_dog_picture() do
    case HTTPoison.get("https://dog.ceo/api/breeds/image/random") do
  {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    IO.puts body
  {:ok, %HTTPoison.Response{status_code: 404}} ->
    IO.puts "Not found :("
  {:error, %HTTPoison.Error{reason: reason}} ->
    IO.inspect reason
end
  end
end
