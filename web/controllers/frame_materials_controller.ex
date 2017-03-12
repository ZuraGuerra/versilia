defmodule Catrina.FrameMaterialsController do
  use Catrina.Web, :controller

  alias Catrina.FrameMaterials

  def index(conn, _params) do
    frame_materials = Repo.all(FrameMaterials)
    render(conn, "index.html", frame_materials: frame_materials)
  end

  def new(conn, _params) do
    changeset = FrameMaterials.changeset(%FrameMaterials{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"frame_materials" => frame_materials_params}) do
    changeset = FrameMaterials.changeset(%FrameMaterials{}, frame_materials_params)

    case Repo.insert(changeset) do
      {:ok, _frame_materials} ->
        conn
        |> put_flash(:info, "Frame materials created successfully.")
        |> redirect(to: frame_materials_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    frame_materials = Repo.get!(FrameMaterials, id)
    render(conn, "show.html", frame_materials: frame_materials)
  end

  def edit(conn, %{"id" => id}) do
    frame_materials = Repo.get!(FrameMaterials, id)
    changeset = FrameMaterials.changeset(frame_materials)
    render(conn, "edit.html", frame_materials: frame_materials, changeset: changeset)
  end

  def update(conn, %{"id" => id, "frame_materials" => frame_materials_params}) do
    frame_materials = Repo.get!(FrameMaterials, id)
    changeset = FrameMaterials.changeset(frame_materials, frame_materials_params)

    case Repo.update(changeset) do
      {:ok, frame_materials} ->
        conn
        |> put_flash(:info, "Frame materials updated successfully.")
        |> redirect(to: frame_materials_path(conn, :show, frame_materials))
      {:error, changeset} ->
        render(conn, "edit.html", frame_materials: frame_materials, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    frame_materials = Repo.get!(FrameMaterials, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(frame_materials)

    conn
    |> put_flash(:info, "Frame materials deleted successfully.")
    |> redirect(to: frame_materials_path(conn, :index))
  end
end
