defmodule Catrina.FrameMaterialsControllerTest do
  use Catrina.ConnCase

  alias Catrina.FrameMaterials
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, frame_materials_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing frame materials"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, frame_materials_path(conn, :new)
    assert html_response(conn, 200) =~ "New frame materials"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, frame_materials_path(conn, :create), frame_materials: @valid_attrs
    assert redirected_to(conn) == frame_materials_path(conn, :index)
    assert Repo.get_by(FrameMaterials, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, frame_materials_path(conn, :create), frame_materials: @invalid_attrs
    assert html_response(conn, 200) =~ "New frame materials"
  end

  test "shows chosen resource", %{conn: conn} do
    frame_materials = Repo.insert! %FrameMaterials{}
    conn = get conn, frame_materials_path(conn, :show, frame_materials)
    assert html_response(conn, 200) =~ "Show frame materials"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, frame_materials_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    frame_materials = Repo.insert! %FrameMaterials{}
    conn = get conn, frame_materials_path(conn, :edit, frame_materials)
    assert html_response(conn, 200) =~ "Edit frame materials"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    frame_materials = Repo.insert! %FrameMaterials{}
    conn = put conn, frame_materials_path(conn, :update, frame_materials), frame_materials: @valid_attrs
    assert redirected_to(conn) == frame_materials_path(conn, :show, frame_materials)
    assert Repo.get_by(FrameMaterials, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    frame_materials = Repo.insert! %FrameMaterials{}
    conn = put conn, frame_materials_path(conn, :update, frame_materials), frame_materials: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit frame materials"
  end

  test "deletes chosen resource", %{conn: conn} do
    frame_materials = Repo.insert! %FrameMaterials{}
    conn = delete conn, frame_materials_path(conn, :delete, frame_materials)
    assert redirected_to(conn) == frame_materials_path(conn, :index)
    refute Repo.get(FrameMaterials, frame_materials.id)
  end
end
