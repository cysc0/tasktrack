alias Tasktrack.Repo
alias Tasktrack.Users.User

Repo.insert!(%User{name: "david", admin: true})
Repo.insert!(%User{name: "eric", admin: false})

