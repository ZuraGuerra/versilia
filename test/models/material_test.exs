defmodule Catrina.MaterialTest do
  use Catrina.ModelCase

  alias Catrina.Material

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Material.changeset(%Material{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Material.changeset(%Material{}, @invalid_attrs)
    refute changeset.valid?
  end
end
