defmodule Catrina.Artist do
  use Catrina.Web, :model
  use Arc.Ecto.Schema

  schema "artists" do
    field :name, :string
    field :description, :string
    field :photo_url, Catrina.ArtistPhoto.Type
    belongs_to :artist_categories, Catrina.ArtistCategories
    has_many :artist_urls, Catrina.ArtistUrls

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :photo_url, :artist_categories_id])
    |> cast_attachments(params, [:photo_url])
    |> validate_required([:name, :description, :photo_url, :artist_categories_id])
  end
end
