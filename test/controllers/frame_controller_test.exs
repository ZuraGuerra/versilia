defmodule Catrina.FrameControllerTest do
  use Catrina.ConnCase

  alias Catrina.Frame
  @valid_attrs %{description: "some content", is_available: true, name: "some content", price: 42, surprise_url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, frame_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing frames"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, frame_path(conn, :new)
    assert html_response(conn, 200) =~ "New frame"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, frame_path(conn, :create), frame: @valid_attrs
    assert redirected_to(conn) == frame_path(conn, :index)
    assert Repo.get_by(Frame, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, frame_path(conn, :create), frame: @invalid_attrs
    assert html_response(conn, 200) =~ "New frame"
  end

  test "shows chosen resource", %{conn: conn} do
    frame = Repo.insert! %Frame{}
    conn = get conn, frame_path(conn, :show, frame)
    assert html_response(conn, 200) =~ "Show frame"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, frame_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    frame = Repo.insert! %Frame{}
    conn = get conn, frame_path(conn, :edit, frame)
    assert html_response(conn, 200) =~ "Edit frame"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    frame = Repo.insert! %Frame{}
    conn = put conn, frame_path(conn, :update, frame), frame: @valid_attrs
    assert redirected_to(conn) == frame_path(conn, :show, frame)
    assert Repo.get_by(Frame, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    frame = Repo.insert! %Frame{}
    conn = put conn, frame_path(conn, :update, frame), frame: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit frame"
  end

  test "deletes chosen resource", %{conn: conn} do
    frame = Repo.insert! %Frame{}
    conn = delete conn, frame_path(conn, :delete, frame)
    assert redirected_to(conn) == frame_path(conn, :index)
    refute Repo.get(Frame, frame.id)
  end
end
