defmodule Catrina.FrameMoodsController do
  use Catrina.Web, :controller

  alias Catrina.FrameMoods

  def index(conn, _params) do
    frame_moods = Repo.all(FrameMoods)
    render(conn, "index.html", frame_moods: frame_moods)
  end

  def new(conn, _params) do
    changeset = FrameMoods.changeset(%FrameMoods{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"frame_moods" => frame_moods_params}) do
    changeset = FrameMoods.changeset(%FrameMoods{}, frame_moods_params)

    case Repo.insert(changeset) do
      {:ok, _frame_moods} ->
        conn
        |> put_flash(:info, "Frame moods created successfully.")
        |> redirect(to: frame_moods_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    frame_moods = Repo.get!(FrameMoods, id)
    render(conn, "show.html", frame_moods: frame_moods)
  end

  def edit(conn, %{"id" => id}) do
    frame_moods = Repo.get!(FrameMoods, id)
    changeset = FrameMoods.changeset(frame_moods)
    render(conn, "edit.html", frame_moods: frame_moods, changeset: changeset)
  end

  def update(conn, %{"id" => id, "frame_moods" => frame_moods_params}) do
    frame_moods = Repo.get!(FrameMoods, id)
    changeset = FrameMoods.changeset(frame_moods, frame_moods_params)

    case Repo.update(changeset) do
      {:ok, frame_moods} ->
        conn
        |> put_flash(:info, "Frame moods updated successfully.")
        |> redirect(to: frame_moods_path(conn, :show, frame_moods))
      {:error, changeset} ->
        render(conn, "edit.html", frame_moods: frame_moods, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    frame_moods = Repo.get!(FrameMoods, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(frame_moods)

    conn
    |> put_flash(:info, "Frame moods deleted successfully.")
    |> redirect(to: frame_moods_path(conn, :index))
  end
end
