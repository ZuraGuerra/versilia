defmodule Catrina.Artist do
  use Catrina.Web, :model

  schema "artists" do
    field :name, :string
    field :description, :string
    field :photo_url, :string
    belongs_to :artist_categories, Catrina.ArtistCategories

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :photo_url, :artist_categories_id])
    |> validate_required([:name, :description, :photo_url, :artist_categories_id])
  end
end
