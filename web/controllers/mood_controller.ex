defmodule Catrina.MoodController do
  use Catrina.Web, :controller

  alias Catrina.Mood

  def index(conn, _params) do
    moods = Repo.all(Mood)
    render(conn, "index.html", moods: moods)
  end

  def new(conn, _params) do
    changeset = Mood.changeset(%Mood{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mood" => mood_params}) do
    changeset = Mood.changeset(%Mood{}, mood_params)

    case Repo.insert(changeset) do
      {:ok, _mood} ->
        conn
        |> put_flash(:info, "Mood created successfully.")
        |> redirect(to: mood_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mood = Repo.get!(Mood, id)
    render(conn, "show.html", mood: mood)
  end

  def edit(conn, %{"id" => id}) do
    mood = Repo.get!(Mood, id)
    changeset = Mood.changeset(mood)
    render(conn, "edit.html", mood: mood, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mood" => mood_params}) do
    mood = Repo.get!(Mood, id)
    changeset = Mood.changeset(mood, mood_params)

    case Repo.update(changeset) do
      {:ok, mood} ->
        conn
        |> put_flash(:info, "Mood updated successfully.")
        |> redirect(to: mood_path(conn, :show, mood))
      {:error, changeset} ->
        render(conn, "edit.html", mood: mood, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mood = Repo.get!(Mood, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mood)

    conn
    |> put_flash(:info, "Mood deleted successfully.")
    |> redirect(to: mood_path(conn, :index))
  end
end
