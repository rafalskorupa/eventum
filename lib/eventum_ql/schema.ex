defmodule EventumQL.Schema do
  @moduledoc false

  use Absinthe.Schema

  query do
    @desc "Get current time"
    field :current_time, :string do
      resolve(fn _, _, _ ->
        {:ok, DateTime.utc_now() |> DateTime.to_iso8601()}
      end)
    end
  end
end
