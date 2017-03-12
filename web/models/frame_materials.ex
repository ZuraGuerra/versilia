defmodule Catrina.FrameMaterials do
  use Catrina.Web, :model

  schema "frame_materials" do
    belongs_to :frame, Catrina.Frame
    belongs_to :material, Catrina.Material

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:frame_id, :material_id])
    |> validate_required([:frame_id, :material_id])
  end
end
