defmodule Catrina.FrameMoods do
  use Catrina.Web, :model
  @fields [:frame_id, :mood_id]

  schema "frame_moods" do
    belongs_to :frame, Catrina.Frame
    belongs_to :mood, Catrina.Mood

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
