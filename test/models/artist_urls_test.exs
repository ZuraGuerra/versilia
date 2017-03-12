defmodule Catrina.ArtistUrlsTest do
  use Catrina.ModelCase

  alias Catrina.ArtistUrls

  @valid_attrs %{name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ArtistUrls.changeset(%ArtistUrls{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ArtistUrls.changeset(%ArtistUrls{}, @invalid_attrs)
    refute changeset.valid?
  end
end
