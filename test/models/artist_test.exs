defmodule Catrina.ArtistTest do
  use Catrina.ModelCase

  alias Catrina.Artist

  @valid_attrs %{description: "some content", name: "some content", photo_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artist.changeset(%Artist{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artist.changeset(%Artist{}, @invalid_attrs)
    refute changeset.valid?
  end
end
