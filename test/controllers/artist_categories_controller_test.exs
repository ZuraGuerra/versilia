defmodule Catrina.ArtistCategoriesControllerTest do
  use Catrina.ConnCase

  alias Catrina.ArtistCategories
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, artist_categories_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing artist categories"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, artist_categories_path(conn, :new)
    assert html_response(conn, 200) =~ "New artist categories"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, artist_categories_path(conn, :create), artist_categories: @valid_attrs
    assert redirected_to(conn) == artist_categories_path(conn, :index)
    assert Repo.get_by(ArtistCategories, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, artist_categories_path(conn, :create), artist_categories: @invalid_attrs
    assert html_response(conn, 200) =~ "New artist categories"
  end

  test "shows chosen resource", %{conn: conn} do
    artist_categories = Repo.insert! %ArtistCategories{}
    conn = get conn, artist_categories_path(conn, :show, artist_categories)
    assert html_response(conn, 200) =~ "Show artist categories"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, artist_categories_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    artist_categories = Repo.insert! %ArtistCategories{}
    conn = get conn, artist_categories_path(conn, :edit, artist_categories)
    assert html_response(conn, 200) =~ "Edit artist categories"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    artist_categories = Repo.insert! %ArtistCategories{}
    conn = put conn, artist_categories_path(conn, :update, artist_categories), artist_categories: @valid_attrs
    assert redirected_to(conn) == artist_categories_path(conn, :show, artist_categories)
    assert Repo.get_by(ArtistCategories, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    artist_categories = Repo.insert! %ArtistCategories{}
    conn = put conn, artist_categories_path(conn, :update, artist_categories), artist_categories: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit artist categories"
  end

  test "deletes chosen resource", %{conn: conn} do
    artist_categories = Repo.insert! %ArtistCategories{}
    conn = delete conn, artist_categories_path(conn, :delete, artist_categories)
    assert redirected_to(conn) == artist_categories_path(conn, :index)
    refute Repo.get(ArtistCategories, artist_categories.id)
  end
end
