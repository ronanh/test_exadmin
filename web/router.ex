defmodule TestExadmin.Router do
  use TestExadmin.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TestExadmin do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # your app's routes
  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes
  end

  # Other scopes may use custom stacks.
  scope "/api", TestExadmin do
    pipe_through :api
    resources "/roles", RoleController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
  end
end
