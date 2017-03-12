defmodule Catrina.MoodControllerTest do
  use Catrina.ConnCase

  alias Catrina.Mood
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mood_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing moods"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, mood_path(conn, :new)
    assert html_response(conn, 200) =~ "New mood"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, mood_path(conn, :create), mood: @valid_attrs
    assert redirected_to(conn) == mood_path(conn, :index)
    assert Repo.get_by(Mood, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mood_path(conn, :create), mood: @invalid_attrs
    assert html_response(conn, 200) =~ "New mood"
  end

  test "shows chosen resource", %{conn: conn} do
    mood = Repo.insert! %Mood{}
    conn = get conn, mood_path(conn, :show, mood)
    assert html_response(conn, 200) =~ "Show mood"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mood_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    mood = Repo.insert! %Mood{}
    conn = get conn, mood_path(conn, :edit, mood)
    assert html_response(conn, 200) =~ "Edit mood"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    mood = Repo.insert! %Mood{}
    conn = put conn, mood_path(conn, :update, mood), mood: @valid_attrs
    assert redirected_to(conn) == mood_path(conn, :show, mood)
    assert Repo.get_by(Mood, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mood = Repo.insert! %Mood{}
    conn = put conn, mood_path(conn, :update, mood), mood: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit mood"
  end

  test "deletes chosen resource", %{conn: conn} do
    mood = Repo.insert! %Mood{}
    conn = delete conn, mood_path(conn, :delete, mood)
    assert redirected_to(conn) == mood_path(conn, :index)
    refute Repo.get(Mood, mood.id)
  end
end
