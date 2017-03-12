defmodule Catrina.Repo.Migrations.CreateFrameMoods do
  use Ecto.Migration

  def change do
    create table(:frame_moods) do
      add :frame_id, references(:frames, on_delete: :nothing)
      add :mood_id, references(:moods, on_delete: :nothing)

      timestamps()
    end
    create index(:frame_moods, [:frame_id])
    create index(:frame_moods, [:mood_id])

  end
end
