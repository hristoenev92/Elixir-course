defmodule SupervisedCalc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  
  use Application

  alias StateHolder
  
  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {StateHolder, 0},
      {SupervisedCalc, 0}
      ##{SupervisedCalc, StateHolder.state()} процеса не е стартиран
      # Starts a worker by calling: SupervisedCalc.Worker.start_link(arg)
      # {SupervisedCalc.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SupervisedCalc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
