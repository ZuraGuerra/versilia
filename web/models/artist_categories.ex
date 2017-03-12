defmodule Catrina.ArtistCategories do
  use Catrina.Web, :model

  schema "artist_categories" do
    field :name, :string
    field :description, :string
    has_many :artists, Catrina.Artist

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end
