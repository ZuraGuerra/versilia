defmodule Catrina.Router do
  use Catrina.Web, :router

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

  scope "/", Catrina do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/anteojos/:id", FrameController, :show

    resources "/artist_categories", ArtistCategoriesController
    resources "/artists", ArtistController
    resources "/artist_urls", ArtistUrlsController
    resources "/materials", MaterialController
    resources "/moods", MoodController
    resources "/frames", FrameController
    resources "/frame_materials", FrameMaterialsController
    resources "/frame_moods", FrameMoodsController
    resources "/frame_photos", FramePhotosController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Catrina do
  #   pipe_through :api
  # end
end
