defmodule Catrina.Repo.Migrations.CreateFrame do
  use Ecto.Migration

  def change do
    create table(:frames) do
      add :name, :string
      add :description, :text
      add :surprise_url, :string
      add :price, :integer
      add :is_available, :boolean, default: true, null: false
      add :artist_id, references(:artists, on_delete: :nothing)

      timestamps()
    end
    create unique_index(:frames, [:name])
    create index(:frames, [:artist_id])

  end
end
