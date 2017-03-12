defmodule Catrina.FrameTest do
  use Catrina.ModelCase

  alias Catrina.Frame

  @valid_attrs %{description: "some content", is_available: true, name: "some content", price: 42, surprise_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Frame.changeset(%Frame{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Frame.changeset(%Frame{}, @invalid_attrs)
    refute changeset.valid?
  end
end
