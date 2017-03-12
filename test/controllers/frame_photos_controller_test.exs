defmodule Catrina.FramePhotosControllerTest do
  use Catrina.ConnCase

  alias Catrina.FramePhotos
  @valid_attrs %{photo_url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, frame_photos_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing frame photos"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, frame_photos_path(conn, :new)
    assert html_response(conn, 200) =~ "New frame photos"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, frame_photos_path(conn, :create), frame_photos: @valid_attrs
    assert redirected_to(conn) == frame_photos_path(conn, :index)
    assert Repo.get_by(FramePhotos, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, frame_photos_path(conn, :create), frame_photos: @invalid_attrs
    assert html_response(conn, 200) =~ "New frame photos"
  end

  test "shows chosen resource", %{conn: conn} do
    frame_photos = Repo.insert! %FramePhotos{}
    conn = get conn, frame_photos_path(conn, :show, frame_photos)
    assert html_response(conn, 200) =~ "Show frame photos"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, frame_photos_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    frame_photos = Repo.insert! %FramePhotos{}
    conn = get conn, frame_photos_path(conn, :edit, frame_photos)
    assert html_response(conn, 200) =~ "Edit frame photos"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    frame_photos = Repo.insert! %FramePhotos{}
    conn = put conn, frame_photos_path(conn, :update, frame_photos), frame_photos: @valid_attrs
    assert redirected_to(conn) == frame_photos_path(conn, :show, frame_photos)
    assert Repo.get_by(FramePhotos, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    frame_photos = Repo.insert! %FramePhotos{}
    conn = put conn, frame_photos_path(conn, :update, frame_photos), frame_photos: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit frame photos"
  end

  test "deletes chosen resource", %{conn: conn} do
    frame_photos = Repo.insert! %FramePhotos{}
    conn = delete conn, frame_photos_path(conn, :delete, frame_photos)
    assert redirected_to(conn) == frame_photos_path(conn, :index)
    refute Repo.get(FramePhotos, frame_photos.id)
  end
end
