defmodule Catrina.PageController do
  use Catrina.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
