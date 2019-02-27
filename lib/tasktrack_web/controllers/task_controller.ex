defmodule TasktrackWeb.TaskController do
  use TasktrackWeb, :controller

  alias Tasktrack.Tasks
  alias Tasktrack.Tasks.Task
  alias Tasktrack.Users

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    IO.inspect(tasks)
    IO.write("%^^%%%%Z4")
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    # convert dict with string keys to atom keys: https://stackoverflow.com/a/31990445
    task = for {key, val} <- task_params, into: %{}, do: {String.to_atom(key), val}
    taskMap = Map.put(task, :user, Users.get_user_by_name(task.user_id))
    IO.inspect(taskMap)
    case Tasks.create_task(taskMap) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    if length(String.split(conn.request_path, "/")) > 1 do
      # if we are showing all of one's users tasks, generate many results
      tasks = Tasks.list_tasks_by_id(id)
      render(conn, "index.html", tasks: tasks)
    else
      # otherwise show a single task
      task = Tasks.get_task!(id)
      render(conn, "show.html", task: task)
    end
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    changeset = Tasks.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
