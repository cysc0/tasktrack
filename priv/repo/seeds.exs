alias Tasktrack.Repo
alias Tasktrack.Users.User
Repo.insert(%User{name: "cisco", admin: true})
Repo.insert(%User{name: "eric", admin: false})

Repo.insert(%User{name: "david", admin: true})
Repo.insert(%User{name: "admin1", admin: true})
Repo.insert(%User{name: "admin2", admin: true})
Repo.insert(%User{name: "admin3", admin: true})





# ciscoTask = %Task{complete: false, description: "sample task", duration: 30, user: cisco}
# Repo.insert(ciscoTask)
# Repo.insert(%Task{complete: true, description: "finished sample task", duration: 60, user: cisco})
# Repo.insert(%Task{complete: false, description: "finished ERIUCHEUS task", duration: 15, user: eric})