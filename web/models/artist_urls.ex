defmodule Catrina.ArtistUrls do
  use Catrina.Web, :model

  schema "artist_urls" do
    field :name, :string
    field :url, :string
    belongs_to :artist, Catrina.Artist

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :url, :artist_id])
    |> validate_required([:name, :url])
  end
end
