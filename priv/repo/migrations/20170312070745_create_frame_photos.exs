defmodule Catrina.Repo.Migrations.CreateFramePhotos do
  use Ecto.Migration

  def change do
    create table(:frame_photos) do
      add :photo_url, :string
      add :frame_id, references(:frames, on_delete: :nothing)

      timestamps()
    end
    create index(:frame_photos, [:frame_id])

  end
end
