defmodule Catrina.MoodTest do
  use Catrina.ModelCase

  alias Catrina.Mood

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Mood.changeset(%Mood{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Mood.changeset(%Mood{}, @invalid_attrs)
    refute changeset.valid?
  end
end
