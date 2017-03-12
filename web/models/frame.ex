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

  def get_recent(qty) do
    from(frame in Catrina.Frame,
         limit: ^qty,
         preload: [:frame_photos, frame_moods: [:mood]])
    |> Catrina.Repo.all
  end

  def with_deep_info(id) do
    from(frame in Catrina.Frame,
         where: frame.id == ^id,
         preload: [:artist,
                   :frame_photos,
                   frame_materials: [:material],
                   frame_moods: [:mood]])
    |> Catrina.Repo.one!
  end
end
