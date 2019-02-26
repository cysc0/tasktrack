defmodule TasktrackWeb.PageController do
    use TasktrackWeb, :controller
  
    def index(conn, _params) do
      render conn, "index.html"
    end
  end
  