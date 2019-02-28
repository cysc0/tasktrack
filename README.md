# Tasktrack

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tasktrack` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tasktrack, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/tasktrack](https://hexdocs.pm/tasktrack).

------

## Design Decisions etc.

### Things I used JS for (3! lines total):
  #### In page/index.html.eex:
  If there is an active user session, any attempt to go to the home screen will
  send the user to the main tasks page.

  #### In app.html.eex:
  I used a minimal amount of javascript to configure the My Tasks link
  I did it this way because that route is dependent on there being an active
  user session, so that behavior is hidden for non-signed in users
  It prevents undefined behavior, and I think it's a reasonable design decision
  since I feel that anyone (non-users) should be able to check up on
  other people's tasks.

------

### User Info
  For non-admins, the user page only displays username and admin status
  For admins, they have the option to edit any user's name or delete them.
  I've seeded 3 admin users, admin1, admin2, admin3 for demonstration purposes.
  Admins can only be edited or deleted by themselves.

  The user page displays all registered users, with each username
  serving as a link to that user's info.

### Task Info
  The main task page displays all tasks for all users. Each task offers
  a link to the corresponding user's page, and a link to the corresponding task.

  The My Tasks page is the same as the Tasks page, but it filters tasks
  for the currently signed in user. This route is disabled if there is no
  active user session.