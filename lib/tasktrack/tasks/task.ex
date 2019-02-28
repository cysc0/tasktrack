defmodule Tasktrack.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :complete, :boolean, default: false
    field :title, :string, default: ""
    field :description, :string
    field :duration, :integer, default: 0
    belongs_to :user, Tasktrack.Users.User
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:complete, :title, :description, :duration, :user_id])
    |> validate_required([:complete, :title, :description, :duration, :user_id])
  end
end
