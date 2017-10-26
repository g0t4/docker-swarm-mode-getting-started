# Errata for the course:

- `docker service` commands no longer run detached by default as of `17.10`
  - This is nice because you get a **progress indicator** in the new interactive mode
  - If you want to run detached simply pass `--detach`
  - Applies to `service create`, `service update`, `service rollback`, and `service scale`
  - For command examples before and after this change and a history of the change, check out this PR, it's great: [docker/cli#525](https://github.com/docker/cli/pull/525)
  
Updated as of 17.10

Keep an eye out for future changes, this is the easiest spot for me to update.
