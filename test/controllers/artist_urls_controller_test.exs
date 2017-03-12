defmodule Catrina.ArtistUrlsControllerTest do
  use Catrina.ConnCase

  alias Catrina.ArtistUrls
  @valid_attrs %{name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, artist_urls_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing artist urls"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, artist_urls_path(conn, :new)
    assert html_response(conn, 200) =~ "New artist urls"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, artist_urls_path(conn, :create), artist_urls: @valid_attrs
    assert redirected_to(conn) == artist_urls_path(conn, :index)
    assert Repo.get_by(ArtistUrls, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, artist_urls_path(conn, :create), artist_urls: @invalid_attrs
    assert html_response(conn, 200) =~ "New artist urls"
  end

  test "shows chosen resource", %{conn: conn} do
    artist_urls = Repo.insert! %ArtistUrls{}
    conn = get conn, artist_urls_path(conn, :show, artist_urls)
    assert html_response(conn, 200) =~ "Show artist urls"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, artist_urls_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    artist_urls = Repo.insert! %ArtistUrls{}
    conn = get conn, artist_urls_path(conn, :edit, artist_urls)
    assert html_response(conn, 200) =~ "Edit artist urls"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    artist_urls = Repo.insert! %ArtistUrls{}
    conn = put conn, artist_urls_path(conn, :update, artist_urls), artist_urls: @valid_attrs
    assert redirected_to(conn) == artist_urls_path(conn, :show, artist_urls)
    assert Repo.get_by(ArtistUrls, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    artist_urls = Repo.insert! %ArtistUrls{}
    conn = put conn, artist_urls_path(conn, :update, artist_urls), artist_urls: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit artist urls"
  end

  test "deletes chosen resource", %{conn: conn} do
    artist_urls = Repo.insert! %ArtistUrls{}
    conn = delete conn, artist_urls_path(conn, :delete, artist_urls)
    assert redirected_to(conn) == artist_urls_path(conn, :index)
    refute Repo.get(ArtistUrls, artist_urls.id)
  end
end
