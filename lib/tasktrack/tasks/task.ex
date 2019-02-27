defmodule Tasktrack.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :complete, :boolean, default: false
    field :description, :string
    field :duration, :integer
    # belongs_to :assignedby, Tasktrack.Users.User
    belongs_to :user, Tasktrack.Users.User
    # TODO: ? restore the creator field
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:complete, :description, :duration, :user_id])
    |> validate_required([:complete, :description, :duration, :user_id])
  end
end
