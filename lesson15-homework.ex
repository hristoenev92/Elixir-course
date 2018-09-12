#create a GenServer, that will hold a simple movie database;
#every movie will be represented by a Map, that has the following keys:
#:id - consecutive number, starting from 0;
#:name - String, the name of the movie;
#:genre - String;
#:actors - a list of names of actors, represented by a string
#:year - Integer;
#:rating - Float;
#The movies themselves will be stored in a list;
#The Genserver should handle a message in the form of
##{:add, <movie>}, that adds a movie to the database;
#the id should be added automatically. Every new movie added, should have the id;
#the first id will be 1;
##{:by_id, <id>}, that finds a movie, based on the id;
##{:newer_than, <year>}, that returns all movies, newer than a particular year;
##{:older_than, <year>}, that returns all movies, older than a particular year;
##{:genre, <genre>}, that returns all moves from that genre;
##{:remove, <id>}, that removes the movie with that id from the database;
##{:by_name, <part_of_name>}, that searches a movie, containing a string in its name (case insensitive);
##{:actor, <actor>}, that returns all movies in which the actor participates

defmodule DB do
  use GenServer

  alias __MODULE__

  def start(_args \\ []) do
     GenServer.start(__MODULE__, 0, name: __MODULE__)
  end

  def init(_) do
    {:ok, [%{id: 0, name: "string", genre: "string", actors: [], year: "int", rating: "fliat"}]}
  end

  ##struct {id:int, name:string, genre:string, actors:[], year:int, rating:float}

  def add(name, genre, actors, year, ratong) do
    GenServer.call(__MODULE__, {:add, name, genre, actors, year, ratong})
  end

  def search_by_id(id) do
    GenServer.call(__MODULE__, {:by_id, id})
  end

  def search_newer_than_year(year) do
    GenServer.call(__MODULE__, {:newer_than, year})
  end

  def search_older_than_year(year) do
    GenServer.call(__MODULE__, {:older_than, year})
  end

  def search_by_genre(genre) do
    GenServer.call(__MODULE__, {:genre, genre})
  end

  def remove(id) do
    GenServer.call(__MODULE__, {:remove, id})
  end

  def search_by_name(partOfName) do
    GenServer.call(__MODULE__, {:by_name, partOfName})
  end

  def search_by_actor(actor) do
    GenServer.call(__MODULE__, {:by_actor, actor})
  end

  def status() do
    GenServer.call(__MODULE__, {:status})
  end

  def handle_call({:add, name, genre, actors, year, rating}, _from, state) do
    new_state = [%{id: 1+Map.get(List.first(state), :id), #защо не става Map.get(List.first(state)+1
                   name: name,
                   genre: genre,
                   actors: actors,
                   year: year,
                   rating: rating}
                 | state]
    new_state = List.delete(new_state, %{id: 0, name: "string", genre: "string", actors: [], year: "int", rating: "fliat"})
    {:reply, "Movie added successfully!", new_state}
  end

  def handle_call({:by_id, id}, _from, state) do
    show = Enum.filter(state, fn %{id: x} -> x == id end)
    {:reply, show, state}
  end

  def handle_call({:newer_than, year}, _from, state) do
    show = Enum.filter(state, fn %{year: x} -> x > year end)
    {:reply, show, state}
  end

  def handle_call({:older_than, year}, _from, state) do
    show = Enum.filter(state, fn %{year: x} -> x < year end)
    {:reply, show, state}
  end

  def handle_call({:genre, genre}, _from, state) do
    show = Enum.filter(state, fn %{genre: x} -> x == genre end)
    {:reply, show, state}
  end

  def handle_call({:remove, id}, _from, state) do
    new_state = List.delete(state, List.first(Enum.filter(state, fn %{id: x} -> x == id end)))
    {:reply, "Movie deleted successfully!", new_state}
  end
 def handle_call({:by_name, partOfName}, _from, state) do
    show = Enum.filter(state, fn %{name: x} -> String.contains?(String.downcase(x),String.downcase(partOfName)) end)
    {:reply, show, state}
  end

  def handle_call({:by_actor, actor}, _from, state) do
    show = Enum.filter(state, fn %{actors: x} ->
      Enum.any?(x, fn y -> y == actor end)
    end)
    {:reply, show, state}
  end

  def handle_call({:status}, _from, state) do
    {:reply, state, state}
  end

end
