defmodule Catrina.Repo.Migrations.CreateArtist do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :name, :string
      add :description, :string
      add :photo_url, :string
      add :artist_categories_id, references(:artist_categories, on_delete: :nothing)

      timestamps()
    end
    create index(:artists, [:artist_categories_id])

  end
end
