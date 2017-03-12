defmodule Catrina.Repo.Migrations.CreateMaterial do
  use Ecto.Migration

  def change do
    create table(:materials) do
      add :name, :string

      timestamps()
    end
    create unique_index(:materials, [:name])

  end
end
