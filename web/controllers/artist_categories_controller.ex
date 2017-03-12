defmodule Catrina.ArtistCategoriesController do
  use Catrina.Web, :controller

  alias Catrina.ArtistCategories

  def index(conn, _params) do
    artist_categories = Repo.all(ArtistCategories)
    render(conn, "index.html", artist_categories: artist_categories)
  end

  def new(conn, _params) do
    changeset = ArtistCategories.changeset(%ArtistCategories{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"artist_categories" => artist_categories_params}) do
    changeset = ArtistCategories.changeset(%ArtistCategories{}, artist_categories_params)

    case Repo.insert(changeset) do
      {:ok, _artist_categories} ->
        conn
        |> put_flash(:info, "Artist categories created successfully.")
        |> redirect(to: artist_categories_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    artist_categories = Repo.get!(ArtistCategories, id)
    render(conn, "show.html", artist_categories: artist_categories)
  end

  def edit(conn, %{"id" => id}) do
    artist_categories = Repo.get!(ArtistCategories, id)
    changeset = ArtistCategories.changeset(artist_categories)
    render(conn, "edit.html", artist_categories: artist_categories, changeset: changeset)
  end

  def update(conn, %{"id" => id, "artist_categories" => artist_categories_params}) do
    artist_categories = Repo.get!(ArtistCategories, id)
    changeset = ArtistCategories.changeset(artist_categories, artist_categories_params)

    case Repo.update(changeset) do
      {:ok, artist_categories} ->
        conn
        |> put_flash(:info, "Artist categories updated successfully.")
        |> redirect(to: artist_categories_path(conn, :show, artist_categories))
      {:error, changeset} ->
        render(conn, "edit.html", artist_categories: artist_categories, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    artist_categories = Repo.get!(ArtistCategories, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(artist_categories)

    conn
    |> put_flash(:info, "Artist categories deleted successfully.")
    |> redirect(to: artist_categories_path(conn, :index))
  end
end
