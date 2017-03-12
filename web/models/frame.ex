defmodule Catrina.Frame do
  use Catrina.Web, :model

  schema "frames" do
    field :name, :string
    field :description, :string
    field :surprise_url, :string
    field :price, :integer
    field :is_available, :boolean, default: true
    belongs_to :artist, Catrina.Artist
    has_many :frame_materials, Catrina.FrameMaterials
    has_many :frame_moods, Catrina.FrameMoods
    has_many :frame_photos, Catrina.FramePhotos

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :surprise_url, :price, :is_available, :artist_id])
    |> validate_required([:name, :description, :surprise_url, :price, :is_available])
    |> unique_constraint(:name)
  end
end
