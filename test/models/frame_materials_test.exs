defmodule Catrina.FrameMaterialsTest do
  use Catrina.ModelCase

  alias Catrina.FrameMaterials

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FrameMaterials.changeset(%FrameMaterials{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FrameMaterials.changeset(%FrameMaterials{}, @invalid_attrs)
    refute changeset.valid?
  end
end
