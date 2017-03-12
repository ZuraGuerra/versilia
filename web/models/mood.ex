defmodule Catrina.Mood do
  use Catrina.Web, :model

  schema "moods" do
    field :name, :string
    field :description, :string
    has_many :frame_moods, Catrina.FrameMoods

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
