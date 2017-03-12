defmodule Catrina.FrameMoodsControllerTest do
  use Catrina.ConnCase

  alias Catrina.FrameMoods
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, frame_moods_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing frame moods"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, frame_moods_path(conn, :new)
    assert html_response(conn, 200) =~ "New frame moods"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, frame_moods_path(conn, :create), frame_moods: @valid_attrs
    assert redirected_to(conn) == frame_moods_path(conn, :index)
    assert Repo.get_by(FrameMoods, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, frame_moods_path(conn, :create), frame_moods: @invalid_attrs
    assert html_response(conn, 200) =~ "New frame moods"
  end

  test "shows chosen resource", %{conn: conn} do
    frame_moods = Repo.insert! %FrameMoods{}
    conn = get conn, frame_moods_path(conn, :show, frame_moods)
    assert html_response(conn, 200) =~ "Show frame moods"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, frame_moods_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    frame_moods = Repo.insert! %FrameMoods{}
    conn = get conn, frame_moods_path(conn, :edit, frame_moods)
    assert html_response(conn, 200) =~ "Edit frame moods"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    frame_moods = Repo.insert! %FrameMoods{}
    conn = put conn, frame_moods_path(conn, :update, frame_moods), frame_moods: @valid_attrs
    assert redirected_to(conn) == frame_moods_path(conn, :show, frame_moods)
    assert Repo.get_by(FrameMoods, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    frame_moods = Repo.insert! %FrameMoods{}
    conn = put conn, frame_moods_path(conn, :update, frame_moods), frame_moods: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit frame moods"
  end

  test "deletes chosen resource", %{conn: conn} do
    frame_moods = Repo.insert! %FrameMoods{}
    conn = delete conn, frame_moods_path(conn, :delete, frame_moods)
    assert redirected_to(conn) == frame_moods_path(conn, :index)
    refute Repo.get(FrameMoods, frame_moods.id)
  end
end
