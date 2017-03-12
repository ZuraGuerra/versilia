defmodule Catrina.FrameMoodsTest do
  use Catrina.ModelCase

  alias Catrina.FrameMoods

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FrameMoods.changeset(%FrameMoods{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FrameMoods.changeset(%FrameMoods{}, @invalid_attrs)
    refute changeset.valid?
  end
end
