defmodule TestExadmin.PageController do
  use TestExadmin.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
