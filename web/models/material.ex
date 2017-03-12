defmodule Catrina.Material do
  use Catrina.Web, :model

  schema "materials" do
    field :name, :string
    has_many :frame_materials, Catrina.FrameMaterials

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
