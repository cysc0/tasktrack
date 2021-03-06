defmodule TasktrackWeb.Router do
    use TasktrackWeb, :router
  
    pipeline :browser do
      plug :accepts, ["html"]
      plug :fetch_session
      plug :fetch_flash
      plug :protect_from_forgery
      plug :put_secure_browser_headers
      plug TasktrackWeb.Plugs.FetchSession
    end
  
    pipeline :api do
      plug :accepts, ["json"]
    end
  
    scope "/", TasktrackWeb do
      pipe_through :browser # Use the default browser stack
  
      get "/", PageController, :index
      resources "/tasks", TaskController
      resources "/mytasks", TaskController
      resources "/users", UserController
      resources "/sessions", SessionController, only: [:create, :delete], singleton: true
    end
  
    # Other scopes may use custom stacks.
    # scope "/api", TasktrackWeb do
    #   pipe_through :api
    # end
  end
  