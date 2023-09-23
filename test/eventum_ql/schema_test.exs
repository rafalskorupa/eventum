defmodule EventumQL.SchemaTest do
  use EventumWeb.ConnCase

  @current_time_query """
  query currentTime {
    currentTime
  }
  """

  test "query: currentTime", %{conn: conn} do
    conn = post(conn, "/api/ql", %{"query" => @current_time_query})

    assert %{"data" => %{"currentTime" => current_time}} = json_response(conn, 200)
    assert current_time
  end
end
