defmodule Catrina.Repo.Migrations.CreateMood do
  use Ecto.Migration

  def change do
    create table(:moods) do
      add :name, :string
      add :description, :text

      timestamps()
    end
    create unique_index(:moods, [:name])

  end
end
