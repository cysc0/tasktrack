alias Tasktrack.Repo
alias Tasktrack.Users.User
cisco = %User{name: "cisco", admin: true}
eric = %User{name: "eric", admin: false}

Repo.insert(%User{name: "david", admin: true})
Repo.insert(eric)
Repo.insert(cisco)

alias Tasktrack.Tasks.Task


# ciscoTask = %Task{complete: false, description: "sample task", duration: 30, user: cisco}
# IO.inspect(ciscoTask)
# Repo.insert(ciscoTask)
# Repo.insert(%Task{complete: true, description: "finished sample task", duration: 60, user: cisco})
# Repo.insert(%Task{complete: false, description: "finished ERIUCHEUS task", duration: 15, user: eric})