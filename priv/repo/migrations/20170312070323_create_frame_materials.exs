defmodule Catrina.Repo.Migrations.CreateFrameMaterials do
  use Ecto.Migration

  def change do
    create table(:frame_materials) do
      add :frame_id, references(:frames, on_delete: :nothing)
      add :material_id, references(:materials, on_delete: :nothing)

      timestamps()
    end
    create index(:frame_materials, [:frame_id])
    create index(:frame_materials, [:material_id])

  end
end
