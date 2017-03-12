defmodule Catrina.FramePhotosTest do
  use Catrina.ModelCase

  alias Catrina.FramePhotos

  @valid_attrs %{photo_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FramePhotos.changeset(%FramePhotos{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FramePhotos.changeset(%FramePhotos{}, @invalid_attrs)
    refute changeset.valid?
  end
end
