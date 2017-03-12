defmodule Catrina.FramePhotosController do
  use Catrina.Web, :controller

  alias Catrina.FramePhotos

  def index(conn, _params) do
    frame_photos = Repo.all(FramePhotos)
    render(conn, "index.html", frame_photos: frame_photos)
  end

  def new(conn, _params) do
    changeset = FramePhotos.changeset(%FramePhotos{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"frame_photos" => frame_photos_params}) do
    changeset = FramePhotos.changeset(%FramePhotos{}, frame_photos_params)

    case Repo.insert(changeset) do
      {:ok, _frame_photos} ->
        conn
        |> put_flash(:info, "Frame photos created successfully.")
        |> redirect(to: frame_photos_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    frame_photos = Repo.get!(FramePhotos, id)
    render(conn, "show.html", frame_photos: frame_photos)
  end

  def edit(conn, %{"id" => id}) do
    frame_photos = Repo.get!(FramePhotos, id)
    changeset = FramePhotos.changeset(frame_photos)
    render(conn, "edit.html", frame_photos: frame_photos, changeset: changeset)
  end

  def update(conn, %{"id" => id, "frame_photos" => frame_photos_params}) do
    frame_photos = Repo.get!(FramePhotos, id)
    changeset = FramePhotos.changeset(frame_photos, frame_photos_params)

    case Repo.update(changeset) do
      {:ok, frame_photos} ->
        conn
        |> put_flash(:info, "Frame photos updated successfully.")
        |> redirect(to: frame_photos_path(conn, :show, frame_photos))
      {:error, changeset} ->
        render(conn, "edit.html", frame_photos: frame_photos, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    frame_photos = Repo.get!(FramePhotos, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(frame_photos)

    conn
    |> put_flash(:info, "Frame photos deleted successfully.")
    |> redirect(to: frame_photos_path(conn, :index))
  end
end
