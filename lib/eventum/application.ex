defmodule Eventum.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EventumWeb.Telemetry,
      # Start the Ecto repository
      Eventum.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Eventum.PubSub},
      # Start Finch
      {Finch, name: Eventum.Finch},
      # Start the Endpoint (http/https)
      EventumWeb.Endpoint
      # Start a worker by calling: Eventum.Worker.start_link(arg)
      # {Eventum.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Eventum.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EventumWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
