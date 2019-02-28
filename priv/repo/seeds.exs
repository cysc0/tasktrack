alias Tasktrack.Repo
alias Tasktrack.Users.User

Repo.insert(%User{name: "admin1", admin: true})
Repo.insert(%User{name: "admin2", admin: true})
Repo.insert(%User{name: "admin3", admin: true})