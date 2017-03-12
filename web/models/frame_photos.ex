defmodule Catrina.FramePhotos do
  use Catrina.Web, :model
  use Arc.Ecto.Schema

  schema "frame_photos" do
    field :photo_url, Catrina.FramePhoto.Type
    belongs_to :frame, Catrina.Frame

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:photo_url, :frame_id])
    |> cast_attachments(params, [:photo_url])
    |> validate_required([:photo_url, :frame_id])
  end
end
