defmodule Catrina.FrameController do
  use Catrina.Web, :controller

  alias Catrina.Frame

  def index(conn, _params) do
    frames = Repo.all(Frame)
    render(conn, "index.html", frames: frames)
  end

  def new(conn, _params) do
    changeset = Frame.changeset(%Frame{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"frame" => frame_params}) do
    changeset = Frame.changeset(%Frame{}, frame_params)

    case Repo.insert(changeset) do
      {:ok, _frame} ->
        conn
        |> put_flash(:info, "Frame created successfully.")
        |> redirect(to: frame_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    frame = Catrina.Frame.with_deep_info(id)
    render(conn, "show.html", frame: frame)
  end

  def edit(conn, %{"id" => id}) do
    frame = Repo.get!(Frame, id)
    changeset = Frame.changeset(frame)
    render(conn, "edit.html", frame: frame, changeset: changeset)
  end

  def update(conn, %{"id" => id, "frame" => frame_params}) do
    frame = Repo.get!(Frame, id)
    changeset = Frame.changeset(frame, frame_params)

    case Repo.update(changeset) do
      {:ok, frame} ->
        conn
        |> put_flash(:info, "Frame updated successfully.")
        |> redirect(to: frame_path(conn, :show, frame))
      {:error, changeset} ->
        render(conn, "edit.html", frame: frame, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    frame = Repo.get!(Frame, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(frame)

    conn
    |> put_flash(:info, "Frame deleted successfully.")
    |> redirect(to: frame_path(conn, :index))
  end
end
