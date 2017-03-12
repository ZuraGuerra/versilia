defmodule Catrina.Repo.Migrations.CreateArtistCategories do
  use Ecto.Migration

  def change do
    create table(:artist_categories) do
      add :name, :string
      add :description, :text

      timestamps()
    end
    create unique_index(:artist_categories, [:name])

  end
end
