defmodule Catrina.Repo.Migrations.CreateArtistUrls do
  use Ecto.Migration

  def change do
    create table(:artist_urls) do
      add :name, :string
      add :url, :string
      add :artist_id, references(:artists, on_delete: :nothing)

      timestamps()
    end
    create index(:artist_urls, [:artist_id])

  end
end
