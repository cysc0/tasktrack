# Tasktrack

**TODO: Add description**

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

TODO:
better guards against current_user.admin and user.admin etc since that breaks errythang
prevent overwriting users, only delete
be sure admins can delete shit
maybe admins can grant admin?
figure out making the tasks
  w/ dropdown for users

Things I used JS for (3! lines total):
  In page/index.html.eex:
  If there is an active user session, any attempt to go to the home screen will
  send the user to the main tasks page.

  In app.html.eex:
  I used a minimal amount of javascript to configure the My Tasks link
  I did it this way because that route is dependent on there being an active
  user session, so that behavior is hidden for non-signed in users
  It prevents undefined behavior, and I think it's a reasonable design decision
  since I feel that anyone (non-users) should be able to check up on
  other people's tasks.