defmodule Catrina.ArtistUrlsController do
  use Catrina.Web, :controller

  alias Catrina.ArtistUrls

  def index(conn, _params) do
    artist_urls = Repo.all(ArtistUrls)
    render(conn, "index.html", artist_urls: artist_urls)
  end

  def new(conn, _params) do
    changeset = ArtistUrls.changeset(%ArtistUrls{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"artist_urls" => artist_urls_params}) do
    changeset = ArtistUrls.changeset(%ArtistUrls{}, artist_urls_params)

    case Repo.insert(changeset) do
      {:ok, _artist_urls} ->
        conn
        |> put_flash(:info, "Artist urls created successfully.")
        |> redirect(to: artist_urls_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    artist_urls = Repo.get!(ArtistUrls, id)
    render(conn, "show.html", artist_urls: artist_urls)
  end

  def edit(conn, %{"id" => id}) do
    artist_urls = Repo.get!(ArtistUrls, id)
    changeset = ArtistUrls.changeset(artist_urls)
    render(conn, "edit.html", artist_urls: artist_urls, changeset: changeset)
  end

  def update(conn, %{"id" => id, "artist_urls" => artist_urls_params}) do
    artist_urls = Repo.get!(ArtistUrls, id)
    changeset = ArtistUrls.changeset(artist_urls, artist_urls_params)

    case Repo.update(changeset) do
      {:ok, artist_urls} ->
        conn
        |> put_flash(:info, "Artist urls updated successfully.")
        |> redirect(to: artist_urls_path(conn, :show, artist_urls))
      {:error, changeset} ->
        render(conn, "edit.html", artist_urls: artist_urls, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    artist_urls = Repo.get!(ArtistUrls, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(artist_urls)

    conn
    |> put_flash(:info, "Artist urls deleted successfully.")
    |> redirect(to: artist_urls_path(conn, :index))
  end
end
